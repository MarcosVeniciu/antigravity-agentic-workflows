# Execution Manual: Reactive Debugger (`/test-fix`)

Reference manual for traceback analysis and root cause classification.

---

## 1. Error Analysis Protocol

### 1.1. Ingestion & Checklist (`task.md`)
Upon receiving errors in the test output:
1. Build the checklist in `task.md` based on `resources/error_checklist_template.md`.
2. Process one failure at a time, marking `[/]` when in progress and `[x]` when completed.

### 1.2. Root Cause Classification Matrix

| Category | Description | Adjustment Strategy |
|---|---|---|
| **Type Mismatch** | Incompatible return or parameter type. | Adjust conversion or type hint in production. |
| **Missing Import** | Module or method not found. | Add missing import statement. |
| **Logic Error** | Assertion does not match calculated value. | Fix calculation logic in production. |
| **Mock/Fixture Error** | Incorrectly mocked boundary. | Adjust mock configuration in test/fixture. |

---

## 2. Summarized Output Format

> **Root Cause**: [Classification]: [Concise explanation in exactly 1 sentence].

[Corrected code blocks with respective file paths]

```bash
# Isolated command for test re-execution
pytest path/to/test_file.py -k test_name
```

> **[NEXT STEP]** *"Surgical fix applied and validated. If all tests are green, execute `/refactor` (or `/review` if fixing an audit finding) to continue the development cycle."*