# Agente de Testes (`/testes` / `tdd-tests`) - A Fase Vermelha (Red Phase)

O agente de **Testes** inicia a **Fase 2 (Implementação Loop TDD)**. Seguindo estritamente a filosofia TDD (Test-Driven Development), ele atua na **Fase Vermelha (Red Phase)**, criando a suíte de testes automatizados e stubs de assinatura antes de qualquer linha de lógica de produção ser escrita.

---

## 1. Foco e Estrutura dos Testes

O agente traduz os contratos e cenários da especificação em asserções executáveis.

### Padrão AAA (Arrange-Act-Assert)
Todos os testes são organizados rigorosamente na estrutura:
1. **Arrange:** Configuração do estado inicial, mocks de fronteira e fixtures.
2. **Act:** Execução da função ou método sob teste.
3. **Assert:** Validação dos resultados e efeitos colaterais esperados.

### As 6 Categorias de Cobertura Obrigatórias
- **Caminho Feliz (Happy Path):** Fluxos nominais com entradas válidas e retornos esperados.
- **Casos de Borda (Edge Cases):** Limites numéricos (0, `MAX_INT`), strings vazias, valores nulos e coleções vazias.
- **Caminhos de Exceção (Exceptions):** Lançamento de exceções tipadas de domínio sob entradas inválidas.
- **Resiliência e Performance:** Limiares de tempo de execução e simulação de falhas transitórias em mocks.
- **Concorrência e Race Conditions (TOCTOU):** Disparo paralelo de requisições simultâneas (`ThreadPoolExecutor`, `Promise.all`, `Future.wait`) para garantir atomicidade de saldo, estoque ou resgate de cupons únicos.
- **Fronteiras de Segurança:** Rejeição de IDOR (403 Forbidden), ausência de tokens CSRF, mascaramento de PII em logs (`caplog`) e payloads de erro sem vazamento de stack trace.

---

## 2. Restrições Estritas e Geração de Stubs

- **Proibido Gerar Lógica:** O agente de testes jamais escreve implementação funcional nos arquivos de produção.
- **Geração de Stubs:** Ele cria assinaturas vazias (`pass` / `return None`) nos arquivos de produção para garantir que a suíte de testes possa ser importada sem erros de sintaxe.
- **Execução do Usuário:** Comandos de teste (ex: `pytest -v`) são fornecidos em bloco bash isolado para execução manual pelo desenvolvedor.

---

## 🔀 Arquitetura Router & Skill

* **Workflow Roteador:** [`workflows/implement.md`](file:///e:/Codigos/antigravity-agentic-workflows/workflows/implement.md)
* **Skill Associada:** [`skills/tdd-tests/`](file:///e:/Codigos/antigravity-agentic-workflows/skills/tdd-tests/)
* **Documentação Detalhada:** [`docs/skills/tdd-tests.md`](file:///e:/Codigos/antigravity-agentic-workflows/docs/skills/tdd-tests.md)
* **Padrões de Testes & Mocks:** [`skills/tdd-tests/references/aaa_mock_patterns.md`](file:///e:/Codigos/antigravity-agentic-workflows/skills/tdd-tests/references/aaa_mock_patterns.md)
