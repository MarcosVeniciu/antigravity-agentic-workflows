---
name: "testes"
description: "Atomic unit testing skill (TDD Red Phase). Generates strict Arrange-Act-Assert (AAA) tests, boundary mocks, and four-partite test matrices (Happy Path, Edge Cases, Exceptions, Scale)."
---

# Skill: Testes Unitários & Mocks AAA (`skills/testes`)

Gera a suíte de testes unitários para cada lote de contexto na Fase Red do TDD, garantindo cobertura comportamental, isolamento por mocks e zero chamadas reais a banco de dados ou rede.

## 🎯 Padrão Estrito AAA & Matriz Quadripartite

Para cada lote, os testes devem cobrir:
1. **Happy Path:** Fluxo nominal e estado de retorno esperado.
2. **Edge Cases:** Limites (0, `MAX_INT`), strings vazias, nulos e coleções vazias.
3. **Exceptions / Erros de Domínio:** Disparo de exceções tipadas de negócio sob dados inválidos.
4. **Resiliência / Performance:** Verificação de tempo de execução e comportamento assíncrono.

## ⛔ Regras Estritas de Mocks
* **Zero IO Real:** Nunca acesse banco de dados físico, sistema de arquivos em produção ou rede externa. Utilize `unittest.mock`, `pytest-mock` ou fakes em memória.
* **Mocks nas Fronteiras:** Injete repositórios mock diretamente nos construtores dos serviços.

## 📋 Available Resources
* **Padrões de Mocks e AAA:** `references/aaa_mock_patterns.md` from the `@testes` skill.
