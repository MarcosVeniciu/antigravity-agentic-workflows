---
name: "codigo"
description: "Garante a escrita de código de produção mínimo seguindo TDD (Green Phase), SOLID e Type Hints."
---

# Skill: TDD Green Phase

Esta skill fornece diretrizes de engenharia para implementação do código de produção mínimo durante o ciclo TDD.

## Diretrizes Fundamentais
* **Código Estritamente Mínimo:** Escreva apenas o código suficiente para satisfazer as asserções dos testes (evite over-engineering).
* **Qualidade e SOLID:** Garanta que cada módulo possua responsabilidade única e explicitada.
* **Typing e Docstrings:** Aplique tipagem estática explicita (Type Hints) e crie docstrings com contexto de domínio.
* **Progressive Disclosure:** Para orientações detalhadas de arquitetura e casos complexos, consulte a referência em `references/EXECUTION.md`.

## Uso de Recursos
* **Templates de Tarefas:** Utilize `resources/task_template.md` para estruturar o checklist no artefato interativo.
* **Padrão de Docstrings:** Siga o modelo de código em `examples/docstring_example.py`.
* **Registro de Pivots:** Caso encontre desvios arquiteturais durante o TDD, gere um registro de pivot usando `resources/pivot_template.md` e grave em `02-auditorias/pivots-[feature-slug].md`.