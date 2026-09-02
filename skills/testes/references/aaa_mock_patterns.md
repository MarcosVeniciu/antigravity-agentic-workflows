# Padrões de Testes Unitários AAA e Isolamento de Mocks

Este guia estabelece o padrão de codificação para suítes de teste unitário.

---

## 🏗️ Estrutura Canônica Arrange-Act-Assert (AAA)

Todo teste unitário deve ter as 3 seções explicitamente identificadas por comentários:

```python
import pytest
from unittest.mock import create_autospec

def test_should_register_producer_successfully():
    # Arrange (Preparação do cenário e injeção de mocks)
    mock_repo = create_autospec(IProducerRepository, instance=True)
    mock_repo.find_by_email.return_value = None
    mock_repo.save.return_value = Producer(id="prod-1", email="valid@domain.com")
    service = RegisterProducerUseCase(repository=mock_repo)
    payload = {"email": "valid@domain.com", "name": "Produtor A"}

    # Act (Execução da ação sob teste)
    result = service.execute(payload)

    # Assert (Validação das asserções e estados)
    assert result.id == "prod-1"
    mock_repo.find_by_email.assert_called_once_with("valid@domain.com")
    mock_repo.save.assert_called_once()
```

---

## 🛡️ Diretrizes de Mocks
1. **Mock apenas o que está fora da unidade:** Não faça mock de classes internas ou DTOs de dados simples; faça mock de fronteiras de I/O (repositórios, adaptadores de rede, clientes HTTP).
2. **Use `spec` ou `autospec`:** Garante que o mock quebre caso a interface real mude ou métodos inexistentes sejam chamados.
