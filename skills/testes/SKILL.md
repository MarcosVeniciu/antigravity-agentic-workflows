---
name: "testes"
description: "Skill de automação TDD Red Phase. Constrói suítes de teste de comportamento (AAA), mocks de borda e relatórios nativos de profiling Big-O."
---

# Skill: TDD Red Phase & Design de Testes (`skills/testes`)

Gerencia a fase inicial do ciclo TDD (Red Phase), construindo suítes comportamentais completas e stubs de métodos sem implementar lógica de produção.

---

## 🛠️ Guia de Execução

Consulte as instruções operacionais detalhadas no arquivo de referência:
* [Guia de Execução SDET (Red Phase)](references/EXECUTION.md)

---

## 📁 Recursos & Templates

* **Template de Profiling Nativo**: [profiling_template.md](resources/profiling_template.md) (para testes de performance e análise Big-O com `print()`).

---

## ⛔ Regras Universais & Restrições

1. **Protocolo AAA**: Todo teste deve conter os blocos Arrange, Act e Assert explicitamente demarcados.
2. **Stubs Limpos**: Se a classe ou método testado não existir no código de produção, crie a assinatura básica com `pass` em seu respectivo arquivo para garantir importação limpa.
3. **Mocks na Fronteira**: Mocar chamadas de banco de dados, APIs de terceiros e operações de sistema de arquivos.

---

## ✅ Checklist de Validação

- [ ] Suíte inclui Happy Path, Edge Cases, Exceções e Profiling de Performance?
- [ ] O relatório de performance imprime a tabela formatada no `stdout`?
- [ ] Nenhum método em arquivos de produção possui lógica implementada?
- [ ] O comando de teste foi fornecido em bloco `bash` isolado (com `-s -v`)?
