# Guia de Referência: Test Design & SDET Execution (Red Phase)

Este documento serve como guia de consulta técnica para a construção de suítes de testes comportamentais da Fase 2 (Red Phase) sob o paradigma TDD.

---

## 🎯 Princípios de Teste na Red Phase

1. **Garantia de Falha Esperada (Red Condition)**:
   * Todos os testes gerados devem obrigatoriamente FALHAR nos stubs.
   * As falhas aceitáveis são `NotImplementedError`, `AttributeError` ou asserções com retorno `None`/`pass`.
   * Testes não devem falhar por erros de sintaxe ou erros de importação (por isso os stubs de código são criados primeiro).

2. **Isolamento de Camadas (Mocking Inviolável)**:
   * **Bancos de Dados**: Nunca realize chamadas reais a BDs. Mantenha fixtures com `unittest.mock` ou `pytest-mock`.
   * **APIs de Terceiros**: Mapeie os contratos de resposta (payloads JSON) e faça o mock no nível de transporte (ex: `httpx`, `requests`).
   * **I/O e FileSystem**: Utilize `tmp_path` nativo do Pytest ou mocks para manipulação de arquivos.

---

## 📐 Estrutura Padrão AAA (Arrange-Act-Assert)

Todo teste deve seguir rigorosamente os três blocos demarcados:

```python
def test_deve_lancar_excecao_quando_email_invalido():
    # Arrange (Preparação do cenário e dados de entrada)
    payload_invalido = {"nome": "Dev", "email": "email_invalido"}
    servico = UsuarioService()

    # Act & Assert (Execução e verificação do comportamento)
    with pytest.raises(EmailInvalidoException):
        servico.cadastrar(payload_invalido)

```

---

## 📊 Matriz Quadripartida de Cenários de Teste

Para cada contrato definido no SDD (`01-concepcao/sdd-[slug].md`), projete testes cobrindo as seguintes frentes:

| Categoria | Foco da Cobertura | Tipo de Verificação |
| --- | --- | --- |
| **Happy Path** | Fluxo nominal com payloads válidos | Verificação de estado retornado e efeitos colaterais. |
| **Edge Cases** | Limites (`0`, `MAX_INT`), arrays vazios, nulos, strings longas | Tolerância a fronteiras e entradas atípicas. |
| **Exceptions** | Regras de negócio violadas, tipos de dados errados | Disparo correto de exceções customizadas de domínio. |
| **Performance** | Análise empírica Big-O com variação de $N$ ($10, 100, 1000$) | Impressão formatada de tempo no `stdout`. |