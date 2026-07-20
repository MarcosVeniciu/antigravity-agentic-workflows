---
name: "testes"
description: "Automação TDD Red Phase. Constrói testes unitários/integração no padrão AAA, stubs neutros, mocks na fronteira e testes de profiling de performance."
---

# Skill: TDD Red Phase & Test Design (`skills/testes`)

Esta habilidade rege a construção técnica de suítes de teste comportamentais e a criação de assinaturas limpas de código de produção.

---

## 🛠️ Recursos & Referências

* **Guia de Execução SDET**: [references/EXECUTION.md](references/EXECUTION.md)
* **Template de Profiling Big-O**: [resources/profiling_template.md](resources/profiling_template.md)

---

## ⛔ Regras Invioláveis de Código & Testes

1. **Zero Lógica de Produção**:
   * É estritamente proibido incluir regras de negócio no código de produção.
   * Crie apenas a estrutura (classes e assinaturas de métodos) retornando `pass` ou `raise NotImplementedError`.

2. **Protocolo AAA (Arrange-Act-Assert)**:
   * Todo teste DEVE conter explicitamente os três blocos demarcados com comentários `# Arrange`, `# Act` e `# Assert`.

3. **Mocks na Fronteira (Isolation)**:
   * Isole chamadas de banco de dados, APIs externas, e I/O de arquivos utilizando `unittest.mock` / `pytest-mock`.

4. **Independência de Execução**:
   * Não execute testes autonomamente via terminal no agente. Forneça o comando pytest formatado em um bloco `bash` para uso do desenvolvedor (ex: `pytest -v -s tests/`).

---

## 📋 Checklist de Validação da Suíte

Antes de finalizar a resposta, valide se a suíte atende aos 4 pilares:
- [ ] **Happy Path**: Cobre o comportamento esperado para entradas válidas.
- [ ] **Edge Cases**: Testa coleções vazias, valores limites (`0`, `-1`, `MAX_INT`) e nulos.
- [ ] **Exceptions**: Assegura que exceções corretas são disparadas com entradas inválidas (`pytest.raises`).
- [ ] **Performance**: Contém teste com laço de medição ($N=10, 100, 1000$) imprimindo tabela no `stdout`.