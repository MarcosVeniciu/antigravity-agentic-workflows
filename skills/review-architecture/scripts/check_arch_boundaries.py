#!/usr/bin/env python3
"""
check_arch_boundaries.py - Architectural Layer Boundary Linter

Enforces Clean Architecture / Ports & Adapters boundary isolation.
Detects illegal infrastructure, framework, and UI imports within pure domain,
entity, and use case layers across Python (.py), TypeScript/JavaScript (.ts, .js), and Dart (.dart).
"""

import sys
import os
import re
import argparse
from pathlib import Path
from dataclasses import dataclass
from typing import List, Dict, Tuple

@dataclass
class BoundaryRule:
    language: str
    extensions: Tuple[str, ...]
    forbidden_patterns: List[Tuple[re.Pattern, str]]  # (regex, description)

RULES: List[BoundaryRule] = [
    # Python Boundary Rules
    BoundaryRule(
        language="Python",
        extensions=(".py",),
        forbidden_patterns=[
            (re.compile(r'^\s*(from|import)\s+(sqlalchemy|flask|fastapi|django|boto3|requests|httpx|aiohttp|pymongo|redis)\b'),
             "Domain layer must not import external database, HTTP client, or web framework packages.")
        ]
    ),
    # TypeScript / JavaScript Boundary Rules
    BoundaryRule(
        language="TypeScript/JavaScript",
        extensions=(".ts", ".tsx", ".js", ".jsx"),
        forbidden_patterns=[
            (re.compile(r'^\s*(import\s+.*from|const\s+.*=\s*require)\s*["\'](axios|express|react|next|typeorm|prisma|@prisma|pg|mysql2?|redis|ioredis)["\']'),
             "Domain layer must not import ORM, HTTP client, React, or server framework modules.")
        ]
    ),
    # Dart / Flutter Boundary Rules
    BoundaryRule(
        language="Dart/Flutter",
        extensions=(".dart",),
        forbidden_patterns=[
            (re.compile(r'^\s*import\s+["\']package:flutter/'),
             "Pure domain/entity/use-case must not depend on Flutter UI framework."),
            (re.compile(r'^\s*import\s+["\'](dart:io|package:http/|package:dio/|package:shared_preferences/|package:sqflite/)'),
             "Pure domain layer must not depend directly on concrete I/O, HTTP, or persistence drivers.")
        ]
    )
]

DOMAIN_KEYWORDS = ("domain", "entities", "entity", "use_cases", "usecases", "usecase", "core/domain")

def is_domain_file(path: Path) -> bool:
    path_str = str(path).replace("\\", "/").lower()
    return any(keyword in path_str for keyword in DOMAIN_KEYWORDS)

@dataclass
class BoundaryViolation:
    file_path: str
    line_number: int
    matched_import: str
    reason: str

def check_file(file_path: Path, force_check: bool = False) -> List[BoundaryViolation]:
    violations: List[BoundaryViolation] = []
    
    if not force_check and not is_domain_file(file_path):
        return violations

    ext = file_path.suffix.lower()
    applicable_rules = [r for r in RULES if ext in r.extensions]
    if not applicable_rules:
        return violations

    try:
        with open(file_path, "r", encoding="utf-8", errors="ignore") as f:
            lines = f.readlines()
    except Exception as e:
        print(f"[WARN] Could not read {file_path}: {e}", file=sys.stderr)
        return violations

    for rule in applicable_rules:
        for idx, line in enumerate(lines, start=1):
            for pattern, reason in rule.forbidden_patterns:
                if pattern.search(line):
                    violations.append(BoundaryViolation(
                        file_path=str(file_path),
                        line_number=idx,
                        matched_import=line.strip(),
                        reason=reason
                    ))
    return violations

def print_report(violations: List[BoundaryViolation], files_scanned: int) -> int:
    print(f"\n{'='*80}")
    print("🏛️  ARCHITECTURAL LAYER BOUNDARY AUDIT REPORT")
    print(f"{'='*80}")
    print(f"Domain files inspected: {files_scanned}")
    print(f"Boundary violations:    {len(violations)}\n")

    if not violations:
        print("✅ [PASS] All domain layers respect architectural boundary isolation.")
        print(f"{'='*80}\n")
        return 0

    print("-" * 80)
    for v in violations:
        print(f"🔴 [VIOLATION] Architectural Leakage in Domain Layer")
        print(f"   📍 Location: {v.file_path}:{v.line_number}")
        print(f"   🔎 Import:   {v.matched_import}")
        print(f"   ⚠️ Reason:   {v.reason}")
        print(f"   💡 Fix:      Invert dependency: declare a domain Interface/Port and inject concrete Adapter via DI.")
        print("-" * 80)

    print(f"{'='*80}\n")
    return 1

def main():
    if hasattr(sys.stdout, "reconfigure"):
        sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    if hasattr(sys.stderr, "reconfigure"):
        sys.stderr.reconfigure(encoding="utf-8", errors="replace")

    parser = argparse.ArgumentParser(
        description="Architectural Boundary Linter for Domain and Entity Isolation"
    )
    parser.add_argument(
        "targets",
        nargs="+",
        help="Files or directories to scan (checks domain/entities/use_cases layers)"
    )
    parser.add_argument(
        "--force-all",
        action="store_true",
        help="Treat all specified files as domain files regardless of folder name"
    )
    parser.add_argument(
        "--exit-zero",
        action="store_true",
        help="Always exit with code 0 (warning mode)"
    )

    args = parser.parse_args()

    files: List[Path] = []
    for t in args.targets:
        p = Path(t)
        if p.is_file():
            files.append(p)
        elif p.is_dir():
            for ext in (".py", ".ts", ".js", ".tsx", ".jsx", ".dart"):
                files.extend(p.glob(f"**/*{ext}"))

    violations: List[BoundaryViolation] = []
    scanned_domain_count = 0
    for f in files:
        if args.force_all or is_domain_file(f):
            scanned_domain_count += 1
            violations.extend(check_file(f, force_check=args.force_all))

    exit_code = print_report(violations, scanned_domain_count)
    if args.exit_zero:
        sys.exit(0)
    sys.exit(exit_code)

if __name__ == "__main__":
    main()
