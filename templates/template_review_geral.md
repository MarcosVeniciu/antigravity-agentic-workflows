# 🔎 General Review Checklist (Quality & Anti-Hallucination)

> **Projeto:** [Project Name]
> **Branch:** [Branch Name]
> **Data:** [YYYY-MM-DD]
> **Autor:** [Name]

> **Purpose:** Ensure comprehensive code quality, single responsibility, readability, and shield the code against AI model anti-patterns and hallucinations.

## How to Audit
Strictly contrast the code with the Domain definitions and the actual package signatures. AI often masks a lack of context with excessive code, invented data, or skipped validations.

---

## 1. Illusory Contracts, Types & AI Hallucinations
**How to Measure:** Verify if imported dependencies exist in the project's pinned version. Look for generic signatures that "evaded" defining the actual data structure.

- [ ] **Ghost APIs:** Does the function attempt to invoke magic parameters or methods in third-party libraries that do not match the real documentation?
- [ ] **Typing Evasion:** Did the AI abuse `**kwargs`, `*args`, generic `dict`, or `Any` in business functions instead of explicating parameters?
- [ ] **Schema Validation:** Are inputs validated using strict models (e.g., Pydantic/Marshmallow) covering all expected fields?
- [ ] **Return Consistency:** Do functions return consistent types (e.g., not mixing `None` with lists without declaring `Optional`)?
- **How to Handle:** Demand that the signature be expanded by listing all parameters explicitly via DTOs/Schemas, and remove `**kwargs` unless it is a structural wrapper. Require explicit `Type Hints` for all public functions.

## 2. Structure, Organization & Readability
**How to Measure:** Read the code looking for architectural boundaries, naming conventions, and excessive nesting.

- [ ] **Single Responsibility:** Does each function/class have one clear responsibility? Are there functions over 25 lines needing extraction?
- [ ] **Naming & Magic Numbers:** Do variables and functions express clear intent? Are "magic numbers" or hardcoded strings extracted into named constants?
- [ ] **Import Organization:** Are imports organized (stdlib → third-party → local) with no unused ghost imports left behind?
- **How to Handle:** Order the extraction of large functions, the creation of named constants, and the cleanup of imports.

## 3. Generation Traces and Dead Code
**How to Measure:** Look for didactic remnants and development garbage typical of LLM generation.

- [ ] **Syntax Lessons:** Are there comments explaining obvious language features (e.g., `# Initializes an empty list`) instead of justifying business rules?
- [ ] **Dummy Variables:** Are there hardcoded mock variables in production code (e.g., `user_id = 999`, fake file paths)?
- **How to Handle:** Order the summary deletion of tautological comments. Replace hardcodes with injection via environment variables or parameters.

## 4. Lying Documentation and Docstrings
**How to Measure:** Cross-reference the `Raises:` block of the docstring with the actual `raise` statements. Cross-reference `Args:` with the signature.

- [ ] **Exception Hallucination:** Does the docstring claim the function raises exceptions that do not exist in the code body?
- [ ] **Tautology:** Is the docstring description merely a literal translation of the method's name?
- [ ] **Domain Context:** Does the docstring link the function to the business rule it resolves?
- **How to Handle:** Demand the rewriting of the docstring focusing on the *Business Domain* and remove any documentation of exceptions that the method does not physically raise.

## 5. Error Handling and Silent Suppression
**How to Measure:** Look for the word `except` and see what happens in the error block. Check for fail-fast principles.

- [ ] **Generic Try/Except:** Does the code use a generic block (e.g., `except Exception as e:`) that masks specific failures or silently returns `None`?
- [ ] **Fail-Fast:** Does the code fail early and explicitly when preconditions (invalid inputs) are not met?
- **How to Handle:** Order the replacement with specific exception classes (e.g., `KeyError`, `ConnectionError`). Ensure the failure halts execution (fail-fast) with descriptive error messages.

## 6. Test Quality (The Safety Net)
**How to Measure:** Review the test files corresponding to the production code.

- [ ] **Coverage & Scenarios:** Are the critical scenarios (happy path, edge cases, exceptions) explicitly covered?
- [ ] **AAA Pattern:** Do tests clearly follow the Arrange-Act-Assert pattern?
- [ ] **Isolation:** Do tests depend on external states (live network, real databases, file systems) instead of using mocks/fixtures?
- **How to Handle:** Demand the restructuring of tests to use AAA, and require mocks/patches for any external I/O boundaries.

---

## Severity Guide

| Emoji | Severity | Action Required |
|---|---|---|
| 🔴 | Critical | Must fix before merge. |
| 🟡 | Major | Should fix before merge. |
| 🔵 | Minor | Can fix in a follow-up. |
