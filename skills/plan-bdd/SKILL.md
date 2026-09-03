---
name: "bdd"
description: "Behavior-Driven Development (BDD) specification skill. Formats business requirements and user stories strictly into pure Gherkin syntax (Given/When/Then) with zero technical implementation bias."
---

# Skill: Especificação Comportamental BDD (`skills/bdd`)

Modela os requisitos funcionais e regras de negócio da feature estritamente na sintaxe Gherkin (`Given/When/Then`), garantindo foco no comportamento do usuário e do sistema sem antecipar código técnico.

## 🎯 Regras de Ouro do BDD

1. **Linguagem Ubíqua e Acessível:**
   * Escreva cenários legíveis por desenvolvedores, POs e usuários de negócio.
   * Evite termos técnicos como `SELECT`, `JSON`, `status HTTP 200` ou `API Endpoint`. Descreva o comportamento visível e a intenção do usuário.
2. **Cobertura Essencial:**
   * Mapeie obrigatoriamente o **Caminho Feliz (Happy Path)**.
   * Mapeie cenários de exceção e borda (**Unhappy Paths**: validação, entradas incorretas, bloqueios e estados inválidos).
3. **Fidelidade à Proposta:**
   * Os cenários devem refletir exatamente o Estado Final aprovado na etapa de debate.

## 📋 Available Resources
* **Template BDD:** `resources/template_bdd.md` from the `@bdd` skill.
* **Exemplo de Referência:** `examples/bdd_checkout_example.md` from the `@bdd` skill.
