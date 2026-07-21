# Batch TDD Execution & Code Standards Manual

## 1. Test Suite Pattern (AAA & Four-Partite Matrix)

For each context batch, the test suite must cover the Four-Partite Matrix:

| Category | Coverage Focus | Verification Type |
| --- | --- | --- |
| **Happy Path** | Nominal flow with valid inputs | Expected state return. |
| **Edge Cases** | Limits (0, `MAX_INT`), nulls, and empties | Resilience and boundary behavior. |
| **Exceptions** | Contract / business rule violations | Standard domain exception firing. |
| **Performance** | Big-O scale analysis ($N=10, 100, 1000$) | `stdout` report via `time.perf_counter()`. |

### Standard AAA Pattern in Python:
```python
def test_should_validate_transaction_successfully():
    # Arrange
    valid_payload = {"amount": 100.0, "account_id": "ACC-123"}
    service = TransactionService(repo_mock)

    # Act
    result = service.process(valid_payload)

    # Assert
    assert result.status == "APPROVED"

```

---

## 2. Production Code Pattern (Green Phase & SOLID)

* **SRP (Single Responsibility Principle):** Lean functions (~20 lines).
* **Strict Type Hints:** All signatures must contain argument and return typing.
* **Traceable Docstrings:** Connect production code to the Obsidian Vault:

```python
def process_payment(data: Dict[str, Any]) -> bool:
    """Processes financial settlement according to domain rules.

    SOLID Principles:
        - SRP: Exclusively focused on settlement calculation.

    Domain Context:
        Ref: Obsidian note [[01-concepcao/sdd-[feature-slug].md]]
        Search Tag: #type/sdd #feature/[feature-slug]
    """
    pass

```

---

## 3. Local Pivot Registration Protocol

If during batch code writing a technical infeasibility of a library or SDD contract is identified:

1. Create/Update document `02-auditorias/pivots-[feature-slug].md` in the Obsidian Vault using `resources/pivot_template.md`.
2. If the change affects global patterns, mark for promotion in `00-core-rules/adrs/`.