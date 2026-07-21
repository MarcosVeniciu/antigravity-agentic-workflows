#!/usr/bin/env python3
"""
Validation script for SDD architecture artifacts.
Ensures implementation_plan.md complies with all formal requirements.
"""

import sys
import re
from pathlib import Path


def validate_sdd_file(filepath: str) -> bool:
    path = Path(filepath)
    if not path.exists():
        print(f"❌ Error: File {filepath} not found.")
        return False

    content = path.read_text(encoding="utf-8")
    errors = []

    # 1. Mandatory Sections Validation
    required_sections = [
        "## 🎯 Goal",
        "## 📋 Sequential Implementation Plan",
        "## 🏗️ Architecture and Contracts",
        "## 💥 Impact Analysis",
    ]
    for section in required_sections:
        if section not in content:
            errors.append(f"Missing mandatory section: '{section}'")

    # 2. Mermaid Diagram Labels Validation (quoted nodes)
    if "```mermaid" in content:
        # Check unquoted label patterns in common connections
        unquoted_mermaid = re.findall(r"\w+-->>\w+:\s*[^\"\n]+", content)
        if unquoted_mermaid:
            errors.append(
                "Mermaid diagram labels must use double quotes. Example failure: "
                + unquoted_mermaid[0]
            )

    if errors:
        print("❌ SDD Validation Failure:")
        for err in errors:
            print(f"  - {err}")
        return False

    print("✅ Success: SDD artifact is fully compliant with standards!")
    return True


if __name__ == "__main__":
    target_file = sys.argv[1] if len(sys.argv) > 1 else "implementation_plan.md"
    success = validate_sdd_file(target_file)
    sys.exit(0 if success else 1)