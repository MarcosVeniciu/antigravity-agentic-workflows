# Agente de Testes (`/testes`) - A Fase Vermelha (Red Phase)

O agente de **Testes** inicia a **Fase 2 (Implementação Loop TDD)**. Seguindo estritamente a filosofia TDD (Test-Driven Development), ele atua na **Fase Vermelha (Red Phase)**, criando a suíte de testes automatizados e stubs de assinatura antes de qualquer linha de lógica de produção ser escrita.

---

## 1. Foco e Estrutura dos Testes

O agente lê a especificação SDD (`01-concepcao/sdd-[feature-slug].md`) gravada no Obsidian Vault e traduz os contratos em asserções executáveis.

### Padrão AAA (Arrange-Act-Assert)
Todos os testes são organizados rigorosamente na estrutura:
1. **Arrange:** Configuração do estado inicial, mocks de fronteira e fixtures.
2. **Act:** Execução da função ou método sob teste.
3. **Assert:** Validação dos resultados e efeitos colaterais esperados.

### As 4 Categorias de Cobertura
- **Caminho Feliz (Happy Path):** Fluxos nominais com entradas válidas.
- **Casos de Borda (Edge Cases):** Limites numéricos, entradas vazias e payloads máximos.
- **Caminhos de Exceção (Exceptions):** Validação de lançamentos de erros e falhas controladas.
- **Profiling de Performance:** Testes com medição iterativa (ex: `time.perf_counter()`) para registrar curvas de tempo de execução no `stdout`.

---

## 2. Restrições Estritas e Geração de Stubs

- **Proibido Gerar Lógica:** O agente de testes jamais escreve implementação funcional nos arquivos de produção.
- **Geração de Stubs:** Ele cria assinaturas vazias (`pass` / `return None`) nos arquivos de produção para garantir que a suíte de testes possa ser importada sem erros de sintaxe.
- **Execução do Usuário:** Comandos de teste (ex: `pytest -v`) são fornecidos em bloco bash isolado para execução manual pelo desenvolvedor.

---

## 🔀 Arquitetura Router & Skill

* **Agente Roteador:** `agents/testes.md`
* **Skill Associada:** `skills/testes/`
* **Referências de Execução:** `skills/testes/references/EXECUTION.md`
