# AAA Unit Testing Patterns & Mock Isolation

This guide establishes the coding standard for unit test suites.

---

## Canonical Arrange-Act-Assert (AAA) Structure

Every unit test must have its 3 sections explicitly delineated with comments:

```python
import pytest
from unittest.mock import create_autospec

def test_should_register_producer_successfully():
    # Arrange (Scenario preparation and mock injection)
    mock_repo = create_autospec(IProducerRepository, instance=True)
    mock_repo.find_by_email.return_value = None
    mock_repo.save.return_value = Producer(id="prod-1", email="valid@domain.com")
    service = RegisterProducerUseCase(repository=mock_repo)
    payload = {"email": "valid@domain.com", "name": "Producer A"}

    # Act (Execution of the action under test)
    result = service.execute(payload)

    # Assert (Verification of assertions and states)
    assert result.id == "prod-1"
    mock_repo.find_by_email.assert_called_once_with("valid@domain.com")
    mock_repo.save.assert_called_once()
```

---

## Mocking Guidelines
1. **Mock only what is outside the unit:** Never mock internal classes or simple data DTOs; mock I/O boundaries (repositories, network adapters, HTTP clients).
2. **Use `spec` or `autospec`:** Ensures mocks break if the actual interface contract changes or non-existent methods are called.

---

## Concurrency & Race Condition Patterns (Polyglot)

When testing operations that mutate shared state, balances, or inventory, execute parallel invocations to prove atomicity:

### Python (`concurrent.futures.ThreadPoolExecutor`)
```python
from concurrent.futures import ThreadPoolExecutor

def test_should_prevent_double_spend_under_concurrent_race():
    # Arrange
    account = Account(id="acc-1", balance=100)
    service = WithdrawService(account_repo=InMemoryAccountRepo(account))

    # Act (20 parallel requests attempting to withdraw 100 concurrently)
    with ThreadPoolExecutor(max_workers=20) as executor:
        futures = [executor.submit(service.withdraw, "acc-1", 100) for _ in range(20)]
        results = [f.result() for f in futures]

    # Assert: Exactly 1 succeeds, 19 fail with InsufficientFundsError
    successes = [r for r in results if r.is_success]
    assert len(successes) == 1
    assert account.balance == 0
```

### TypeScript / Node.js (`Promise.allSettled`)
```typescript
test("should prevent race condition on parallel voucher redemptions", async () => {
    // Arrange
    const service = new RedeemVoucherService(new InMemoryVoucherRepo({ code: "SAVE50", usageLimit: 1 }));

    // Act (20 parallel attempts)
    const attempts = Array.from({ length: 20 }, () => service.execute({ code: "SAVE50", userId: "u-1" }));
    const results = await Promise.allSettled(attempts);

    // Assert: Only 1 promise fulfilled, 19 rejected
    const fulfilled = results.filter(r => r.status === "fulfilled");
    expect(fulfilled.length).toBe(1);
});
```

### Flutter / Dart (`Future.wait`)
```dart
test("should prevent double decrement on concurrent stock reservation", () async {
    // Arrange
    final service = ReserveStockUseCase(repository: InMemoryStockRepo(initialStock: 1));

    // Act (20 concurrent calls)
    final attempts = List.generate(20, (_) => service.reserve(productId: "p-1", quantity: 1));
    final results = await Future.wait(
        attempts.map((f) => f.then((_) => true).catchError((_) => false))
    );

    // Assert: Exactly 1 returned true
    expect(results.where((success) => success).length, equals(1));
});
```

---

## Security Boundary Testing Patterns

### 1. IDOR / Access Control Rejection
```python
def test_should_deny_access_when_requesting_other_user_resource():
    # Arrange
    service = GetOrderDetailsUseCase(repository=mock_repo)
    current_user_id = "user-1"
    target_order_id = "order-of-user-2"

    # Act & Assert
    with pytest.raises(ForbiddenException):
        service.execute(order_id=target_order_id, requester_id=current_user_id)
```

### 2. Log Masking Verification (Zero PII in Logs)
```python
def test_should_never_log_sensitive_password_or_cpf(caplog):
    # Arrange
    service = AuthenticateUserService()
    payload = {"email": "user@domain.com", "password": "SuperSecretPassword123!", "cpf": "123.456.789-00"}

    # Act
    service.authenticate(payload)

    # Assert: Verify logs do not expose sensitive credentials
    assert "SuperSecretPassword123!" not in caplog.text
    assert "123.456.789-00" not in caplog.text
```

### 3. Safe Error Payload (Zero Stack Trace Disclosure)
```python
def test_should_return_generic_error_payload_on_unexpected_internal_crash():
    # Arrange: Force an unhandled database exception
    mock_db.query.side_effect = RuntimeError("FATAL: Database disk failure on /dev/sda1")
    handler = ApiExceptionHandler()

    # Act
    response = handler.handle_exception(RuntimeError())

    # Assert: Client receives generic response, zero internal trace
    assert response.status_code == 500
    assert response.json() == {"error": "INTERNAL_SERVER_ERROR", "code": 500}
    assert "disk failure" not in response.text
    assert "Traceback" not in response.text
```
