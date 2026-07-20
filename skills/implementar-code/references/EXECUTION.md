# Manual de Execução TDD em Lote e Padrões de Código

## 1. Padrão para Suítes de Teste (AAA & Matriz Quadripartida)

Para cada lote contextual, a suíte de testes deve cobrir a Matriz Quadripartida:

| Categoria | Foco da Cobertura | Tipo de Verificação |
| --- | --- | --- |
| **Happy Path** | Fluxo nominal com entradas válidas | Retorno de estado esperado. |
| **Edge Cases** | Limites (0, `MAX_INT`), nulos e vazios | Resiliência e comportamentos de borda. |
| **Exceptions** | Violações de contrato/regras de negócio | Disparo de exceções de domínio padronizadas. |
| **Performance** | Análise de escala Big-O ($N=10, 100, 1000$) | Relatório em `stdout` via `time.perf_counter()`. |

### Estrutura Padrão AAA em Python:
```python
def test_deve_validar_transacao_com_sucesso():
    # Arrange
    payload_valido = {"valor": 100.0, "conta_id": "ACC-123"}
    servico = TransacaoService(repo_mock)

    # Act
    resultado = servico.processar(payload_valido)

    # Assert
    assert resultado.status == "APROVADO"

```

---

## 2. Padrão para Código de Produção (Green Phase & SOLID)

* **SRP (Single Responsibility Principle):** Funções enxutas (~20 linhas).
* **Type Hints Rígidos:** Todas as assinaturas devem conter tipagem de argumentos e retorno.
* **Docstrings Rastreáveis:** Conecte o código de produção ao Obsidian Vault:

```python
def processar_pagamento(dados: Dict[str, Any]) -> bool:
    """Processa liquidação financeira de acordo com as regras de domínio.

    SOLID Principles:
        - SRP: Exclusivamente focado no cálculo de liquidação.

    Domain Context:
        Ref: Obsidian note [[01-concepcao/sdd-[feature-slug].md]]
        Search Tag: #type/sdd #feature/[feature-slug]
    """
    pass

```

---

## 3. Protocolo de Registro de Pivots Locais

Se durante a escrita do código em lote for identificada inviabilidade técnica de uma biblioteca ou contrato do SDD:

1. Crie/Atualize o documento `02-auditorias/pivots-[feature-slug].md` no Obsidian Vault usando `resources/pivot_template.md`.
2. Se a mudança afetar padrões globais, marque para promoção em `00-core-rules/adrs/`.