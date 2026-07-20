---
name: "implementar-plan"
description: "Inteligência de decomposição arquitetural TDD. Analisa BDD/SDD no Obsidian Vault e gera planos e checklists agrupados por Lotes Contextuais."
---

# Skill: Planejamento de Lotes Contextuais (`implementar-plan`)

Esta habilidade rege a análise de requisitos e a estruturação de planos de implementação TDD otimizados para redução de consumo de tokens.

---

## 🛠️ Recursos & Referências
* **Manual de Decomposição**: [references/EXECUTION.md](references/EXECUTION.md)
* **Template de Plano**: [resources/plan_template.md](resources/plan_template.md)
* **Template de Checklist**: [resources/task_template.md](resources/task_template.md)

---

## ⛔ Regras Invioláveis de Planejamento

1. **Agrupamento por Contexto Dependente**:
   * É proibido criar listas de tarefas puramente baseadas em arquivos isolados.
   * Mapeie acoplamentos e interdependências. Componentes que dependem diretamente uns dos outros (ex: Modelo + Repositório + Serviço) DEVEM ser agrupados no mesmo **Lote Contextual**.

2. **Estrutura de Lote Integrado**:
   * Cada lote contextual da checklist deve especificar clareza sobre os testes a serem criados e os códigos de produção correspondentes a serem entregues no mesmo ciclo.

3. **Inclusão da Fase N (Validação de Fechamento)**:
   * A checklist obrigatoriamente deve terminar com uma fase de validação global e execução de testes.