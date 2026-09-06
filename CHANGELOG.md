# Changelog

All notable changes to the **Antigravity Agentic Workflows** framework will be documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and adheres to [Semantic Versioning 2.0.0](https://semver.org/).

---

## 🚀 Release Notes - `v0.8.0` (2026-09-06)

### 🚀 New Features
- `[feat: decompose]`: Implemented macro-architecture epic decomposition workflow (`/decompose`) and evolutionary vertical slicing skill (`plan-decompose`) with comprehensive contracts and slice dependency graphing.
- `[feat: review]`: Implemented multi-domain architectural and security review workflows (`/review`) covering Architecture, Security (OWASP), Quality (AST complexity), Performance, and Resilience.
- `[feat: scanners]`: Added automated scanning scripts for review gates:
  - `check_arch_boundaries.py`: Detects layer violations and UI-to-Domain leakage across Python, TypeScript/JavaScript, and Dart/Flutter.
  - `ast_complexity.py`: Evaluates cyclomatic complexity $V(G) \le 10$, nesting depth, and Big-O asymptotic heuristics with isolated inner function scoping.
  - `scan_sinks.py`: Audits code for SQL/command injections, CORS misconfigurations, and redacts sensitive credentials in reports.
- `[feat: test suite]`: Added comprehensive unit test suite (`tests/skills/test_scanners.py`) ensuring 100% coverage and reliability for automated review scanners.
- `[feat: plan-debate]`: Formalized Socratic inquiry protocols and Outcome-Based Prompting in `skills/plan-debate` for architectural scope discovery.

### 🐛 Bug Fixes
- `[fix: links]`: Fixed documentation paths and relative markdown links across workflow definitions and skill manuals.

### ⚡ Performance & Refactoring
- `[refactor: workflows]`: Refactored `/plan`, `/decompose`, and `/review` workflows to enforce zero-reading-latency skill loading and progressive disclosure.

### ⚠️ Breaking Changes
- *None. All additions are backward-compatible with v0.7.0.*

---

## 🚀 Release Notes - `v0.7.0` (2026-09-04)

### 🚀 New Features
- `[feat: installer]`: Cross-platform installation scripts (`install.ps1`, `install.sh`, `install.bat`) with automated transactional backups, rollback, and uninstallation.
- `[feat: architecture]`: Minimalist agent workflows separated into specialized single-purpose operational skills with progressive disclosure.

---
*Release consolidated via Antigravity Agentic Workflows.*
