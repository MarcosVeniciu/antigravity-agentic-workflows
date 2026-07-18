---
name: "testes"
description: "TDD Red Phase automation skill. Builds behavioral test suites (AAA), edge mocks, and native Big-O profiling reports."
---

# Skill: TDD Red Phase & Test Design (`skills/testes`)

Manages the initial step of the TDD cycle (Red Phase), building complete behavioral test suites and method stubs without implementing production logic. Always communicate with the user in Portuguese.

---

## 🛠️ Execution Guide

Consult detailed operational instructions in the reference file:
* [SDET Execution Guide (Red Phase)](references/EXECUTION.md)

---

## 📁 Resources & Templates

* **Native Profiling Template**: [profiling_template.md](resources/profiling_template.md) (for performance tests and Big-O analysis with `print()`).

---

## ⛔ Universal Rules & Constraints

1. **AAA Protocol**: Every test must contain Arrange, Act, and Assert blocks explicitly demarcated.
2. **Clean Stubs**: If the tested class or method does not exist in production code, create the basic signature with `pass` in its respective file to ensure clean imports.
3. **Boundary Mocks**: Mock database calls, third-party APIs, and filesystem operations.
4. **Micro-Checkpoint**: Upon completing the red test suite and stubs, use the `git` skill (Mode 1) to save the Red Phase checkpoint (`checkpoint(testes): ...`).

---

## ✅ Validation Checklist & Verification Method

- [ ] Does suite cover Happy Path, Edge Cases, Exceptions, and Performance Profiling?
- [ ] Does performance report print formatted table to `stdout`?
- [ ] Do production file methods contain zero implemented business logic?
- [ ] Was test command provided in an isolated `bash` block (with `-s -v`)?
- [ ] Was red test micro-checkpoint recorded by invoking the `git` skill (Mode 1)?
- [ ] Run tests and confirm all fail with stubs (expected RED status)?

