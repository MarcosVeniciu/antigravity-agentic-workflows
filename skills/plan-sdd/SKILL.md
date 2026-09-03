---
name: "sdd"
description: "Software Design Description (SDD) and architectural modeling skill. Translates BDD requirements into safe Mermaid UML diagrams, strict typed contracts/mocks (Pydantic, Zod, TypeScript), and file impact matrices."
---

# Skill: Arquitetura e Contratos Técnicos SDD (`skills/sdd`)

Traduz as regras e cenários do BDD em um blueprint técnico detalhado, definindo diagramas UML de sequência/classe, interfaces tipadas/mocks de fronteira e o plano sequencial de mudanças em arquivos antes do ciclo TDD.

## 🎯 Diretrizes Técnicas

1. **Modelagem Visual Segura (Mermaid.js):**
   * Todos os nós e mensagens devem ter rótulos entre aspas duplas (ex: `node["Serviço (Auth)"]`) para evitar quebras no parser.
   * Priorize `sequenceDiagram` para fluxos distribuídos ou `classDiagram` para estruturas de dados e contratos.
2. **Contratos Tipados Rígidos (Mocks de Fronteira):**
   * Defina contratos com validações explícitas utilizando tipos da linguagem (ex: Pydantic em Python, Zod em TypeScript).
   * Mapeie tipos de entrada, saída e exceções esperadas.
3. **Matriz de Impacto em Arquivos:**
   * Mapeie previamente quais arquivos serão criados (Aditivos) ou modificados (Mutativos) e o nível de risco.

## 📋 Available Resources
* **Template SDD:** `resources/template_sdd.md` from the `@sdd` skill.
* **Manual de Modelagem:** `references/sdd_execution.md` from the `@sdd` skill.
* **Exemplo de Referência:** `examples/sdd_checkout_example.md` from the `@sdd` skill.
* **Script de Validação:** `scripts/validate_sdd_contracts.py` from the `@sdd` skill.
