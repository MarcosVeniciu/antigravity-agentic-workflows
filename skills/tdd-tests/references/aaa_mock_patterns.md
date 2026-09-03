# AAA Unit Testing Patterns & Mock Isolation

This guide establishes the coding standard for unit test suites.

---

## 🏗️ Canonical Arrange-Act-Assert (AAA) Structure

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

## 🛡️ Mocking Guidelines
1. **Mock only what is outside the unit:** Never mock internal classes or simple data DTOs; mock I/O boundaries (repositories, network adapters, HTTP clients).
2. **Use `spec` or `autospec`:** Ensures mocks break if the actual interface contract changes or non-existent methods are called.
