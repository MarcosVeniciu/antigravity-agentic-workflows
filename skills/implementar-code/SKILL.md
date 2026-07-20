---
name: "implementar-code"
description: "Execução atômica TDD por lotes contextuais (Red + Green). Gera testes AAA, mocks na fronteira, código mínimo SOLID, atualização síncrona do checklist e gestão de Pivots."
---

# Skill: Execução TDD em Lote & Engenharia de Código (`implementar-code`)

Esta habilidade fornece as diretrizes técnicas rígidas para geração conjunta de testes e código de produção em uma única chamada de API.

---

## 🛠️ Recursos & Referências
* **Manual de Execução TDD & SOLID**: [references/EXECUTION.md](references/EXECUTION.md)
* **Template de Registros Pivot**: [resources/pivot_template.md](resources/pivot_template.md)
* **Template de Profiling Big-O**: [resources/profiling_template.md](resources/profiling_template.md)
* **Exemplo de Docstring & SOLID**: [examples/docstring_example.py](examples/docstring_example.py)

---

## ⛔ Regras Invioláveis de Execução

1. **Atomicidade da Chamada (Red + Green + Checklist)**:
   * Na mesma resposta da API para um lote, você deve:
     1. Entregar o código completo das suítes de teste (Red).
     2. Entregar o código de produção mínimo satisfazendo esses testes (Green).
     3. Atualizar o arquivo `task_list.md` marcando os itens do lote como concluídos (`[x]`).

2. **Padrão AAA Estrito (Arrange-Act-Assert)**:
   * Todos os testes devem possuir explicitamente as seções demarcadas com `# Arrange`, `# Act` e `# Assert`.

3. **Mocks Invioláveis nas Fronteiras**:
   * Isole Banco de Dados, APIs REST externas e E/S de arquivos com `unittest.mock` / `pytest-mock`.

4. **Código Estritamente Mínimo & SOLID**:
   * Escreva apenas o necessário para fazer as asserções passarem.
   * Adicione Type Hints completos e docstrings vinculadas ao Obsidian Vault.

5. **Registro Automático de Pivots**:
   * Se a implementação exigir desvio em relação ao SDD, crie o registro em `02-auditorias/pivots-[feature-slug].md` usando o template de recurso.