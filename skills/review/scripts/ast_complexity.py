#!/usr/bin/env python3
"""
AST Complexity & Performance Anti-Pattern Scanner (Zero External Dependencies)
Used by the @review skill to calculate Cyclomatic Complexity V(G) and detect Big-O heuristics.
"""

import ast
import argparse
import sys
from pathlib import Path
from typing import List, Dict, Any


class ComplexityVisitor(ast.NodeVisitor):
    def __init__(self, filename: str, threshold: int = 10):
        self.filename = filename
        self.threshold = threshold
        self.high_complexity_functions: List[Dict[str, Any]] = []
        self.heuristic_warnings: List[Dict[str, Any]] = []
        self._loop_depth = 0

    def visit_FunctionDef(self, node: ast.FunctionDef):
        self._analyze_function(node)
        self.generic_visit(node)

    def visit_AsyncFunctionDef(self, node: ast.AsyncFunctionDef):
        self._analyze_function(node)
        self.generic_visit(node)

    def _analyze_function(self, node):
        complexity = 1  # Base complexity
        
        for child in ast.walk(node):
            if isinstance(child, (ast.If, ast.For, ast.While, ast.AsyncFor, ast.With, ast.AsyncWith)):
                complexity += 1
            elif isinstance(child, ast.ExceptHandler):
                complexity += 1
            elif isinstance(child, ast.IfExp):  # Ternary operator
                complexity += 1
            elif isinstance(child, ast.BoolOp):  # 'and' / 'or'
                complexity += len(child.values) - 1
            elif isinstance(child, (ast.ListComp, ast.SetComp, ast.DictComp, ast.GeneratorExp)):
                for comp in child.generators:
                    complexity += len(comp.ifs)

        if complexity > self.threshold:
            self.high_complexity_functions.append({
                "file": self.filename,
                "name": node.name,
                "line": node.lineno,
                "complexity": complexity
            })

    def visit_For(self, node: ast.For):
        self._check_loop(node)

    def visit_AsyncFor(self, node: ast.AsyncFor):
        self._check_loop(node)

    def visit_While(self, node: ast.While):
        self._check_loop(node)

    def _check_loop(self, node):
        self._loop_depth += 1
        
        # Check for nested loops -> O(n^2) or higher
        if self._loop_depth >= 2:
            self.heuristic_warnings.append({
                "file": self.filename,
                "line": node.lineno,
                "type": "O(n^2) Nested Loop",
                "message": f"Nested loop detected at depth {self._loop_depth}. Check asymptotic complexity bounds."
            })
            
        # Check for linear search inside loop -> O(n*m)
        for child in ast.walk(node):
            if isinstance(child, ast.Compare):
                for op in child.ops:
                    if isinstance(op, (ast.In, ast.NotIn)):
                        self.heuristic_warnings.append({
                            "file": self.filename,
                            "line": child.lineno,
                            "type": "Linear Search in Loop",
                            "message": "Found 'in' lookup inside a loop. If target is a list/tuple, complexity may be O(n*m). Consider converting to set/dict."
                        })

        self.generic_visit(node)
        self._loop_depth -= 1


def scan_file(filepath: Path, threshold: int) -> Dict[str, Any]:
    try:
        content = filepath.read_text(encoding="utf-8")
        tree = ast.parse(content, filename=str(filepath))
        visitor = ComplexityVisitor(str(filepath), threshold=threshold)
        visitor.visit(tree)
        return {
            "high_complexity": visitor.high_complexity_functions,
            "warnings": visitor.heuristic_warnings
        }
    except Exception as e:
        return {
            "error": f"Failed to parse {filepath}: {str(e)}",
            "high_complexity": [],
            "warnings": []
        }


def main():
    parser = argparse.ArgumentParser(description="AST Cyclomatic Complexity and Asymptotic Heuristic Scanner")
    parser.add_argument("target", help="File or directory path to scan")
    parser.add_argument("--threshold", type=int, default=10, help="Cyclomatic complexity threshold (default: 10)")
    args = parser.parse_args()

    target_path = Path(args.target)
    if not target_path.exists():
        print(f"Error: Path '{args.target}' does not exist.", file=sys.stderr)
        sys.exit(1)

    files_to_scan = []
    if target_path.is_file() and target_path.suffix == ".py":
        files_to_scan.append(target_path)
    elif target_path.is_dir():
        files_to_scan.extend(target_path.glob("**/*.py"))

    all_high_complexity = []
    all_warnings = []

    for filepath in files_to_scan:
        result = scan_file(filepath, args.threshold)
        if "error" in result:
            print(f"[!] {result['error']}")
        else:
            all_high_complexity.extend(result["high_complexity"])
            all_warnings.extend(result["warnings"])

    sys.stdout.reconfigure(encoding="utf-8")
    print("\n=== AUDIT REPORT: PERFORMANCE & COMPLEXITY ===")
    print(f"Files scanned: {len(files_to_scan)}\n")

    if all_high_complexity:
        print(f"[WARN] HIGH CYCLOMATIC COMPLEXITY V(G) > {args.threshold}")
        for fn in all_high_complexity:
            print(f"  * {fn['file']}:{fn['line']} - Function '{fn['name']}' has V(G) = {fn['complexity']}")
    else:
        print("[OK] Cyclomatic complexity V(G) within limits (<= 10) for all functions.")

    print()
    if all_warnings:
        print("[WARN] ASYMPTOTIC HEURISTIC WARNINGS (Potential Big-O Bottlenecks)")
        for w in all_warnings:
            print(f"  * {w['file']}:{w['line']} [{w['type']}] {w['message']}")
    else:
        print("[OK] No nested loops or linear searches in loops detected.")

    print("\n================================================\n")


if __name__ == "__main__":
    main()
