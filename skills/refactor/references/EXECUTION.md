# Execution Manual: Clean Code Specialist (`/refatorar`)

This guide details technical standards for eliminating Code Smells and applying SOLID principles during the Refactor Phase.

---

## 1. Branch Scope Isolation (Targeted Refactoring)

Before inspecting code smells, restrict analysis to the current branch's changes:
1. Identify origin branch (`develop` by default, or `main`).
2. Run `git --no-pager diff <origin-branch>...HEAD --name-only` to obtain the list of modified files.
3. Limit code smells detection and refactoring exclusively to files present in this list to prevent scope creep into untouched repository code.

---

## 2. Recommended Refactoring Catalog

### 1.1. Guard Clauses (Deep Nesting Elimination)
* **Syntax/Problem**: Nested returns inside multiple `if/else` blocks. Increases cyclomatic complexity.
* **Solution**: Invert logic. Validate edge/error conditions at function start and return or throw exceptions immediately.

### 1.2. Extract Function / Method (SRP - Single Responsibility)
* **Syntax/Problem**: Methods performing validation, calculation, formatting, and persistence in the same code block.
* **Solution**: Isolate sub-tasks into private/internal functions with declarative names (e.g., `_validate_payload()`) and explicit typing.

### 1.3. Named Constants (Magic Numbers Elimination)
* **Syntax/Problem**: Repeated numbers, strings, or literal values in logic (e.g., `if status == 3:` or `tax = val * 0.08`).
* **Solution**: Replace with explicitly named UPPER_CASE constants (e.g., `STATUS_PROCESSING = 3`) at module or class top.

### 1.4. Dependency Inversion (DIP)
* **Syntax/Problem**: Direct instantiation of external services, repositories, or integrations inside domain logic.
* **Solution**: Inject dependencies via constructor using generic interfaces or abstractions.

---

## 2. Post-Refactoring Validation

- [ ] Functions have only one level of abstraction?
- [ ] Modules/Classes respect SRP (Single Responsibility Principle)?
- [ ] All magic constants replaced with descriptive names?
- [ ] Docstrings and Type Hints updated for newly extracted functions?
- [ ] Entire test suite ran and remains 100% green?