---
name: "planejamento"
description: "Skill de planejamento e concepção (Fase 1). Conduz debate BDD via artefatos interativos, define estratégia de branch e persiste especificação no Obsidian."
---

# Skill: Planejamento & Concepção BDD (`skills/planejamento`)

Gerencia a **Fase 1 (Concepção & Contratos)** via artefatos interativos com interrupções para aprovação direta na IDE.

---

## 🔄 Roteador de Estados

Consulte a referência de cada estado antes de agir:

| Estado | Gatilho de Entrada | Artefato Gerado | Feedback | Referência |
| :--- | :--- | :--- | :--- | :--- |
| **STATE 1: Debate** | `/planejamento` | `propostas_planejamento.md` | `RequestFeedback: true` | [STATE1-DEBATE.md](references/STATE1-DEBATE.md) |
| **STATE 2: Branch** | Proceed no STATE 1 | `estrategia_branch.md` | `RequestFeedback: true` | [STATE2-BRANCH_STRATEGY.md](references/STATE2-BRANCH_STRATEGY.md) |
| **STATE 3: Scope** | Proceed no STATE 2 | `especificacao_escopo_bdd.md` | `RequestFeedback: true` | [STATE3-SCOPE_CLOSURE.md](references/STATE3-SCOPE_CLOSURE.md) |
| **STATE 4: Archive** | Proceed no STATE 3 | `resumo_concepcao.md` | `RequestFeedback: false` | [STATE4-ARCHIVING.md](references/STATE4-ARCHIVING.md) |

---

## 🛠️ Recursos & Templates

* **Template BDD**: [template_planejamento.md](resources/template_planejamento.md) (utilizado no STATE 3).
* **Persistência Obsidian**: No STATE 4, o escopo BDD é salvo em `01-concepcao/bdd-[feature-slug].md` acionando a skill `grafo`.
* **Handover Git**: No encerramento da Fase 1 (STATE 4), o commit semântico consolidado é realizado acionando a skill `git` (Modo 2 - Phase Squash).

---

## ⛔ Regras Universais & Restrições

1. **Think First, Code Later**: É estritamente proibido alterar ou criar arquivos de código-fonte na Fase 1.
2. **Consultar o Vault (Pre-flight Check)**: Busque regras de negócio e ADRs existentes antes de formular qualquer proposta.
3. **Controle Interativo via Artefatos**: Sempre defina `RequestFeedback: true` nos artefatos dos estados 1 a 3 para permitir aprovação via botão **Proceed** da IDE.

---

## ✅ Checklist de Validação & Método de Verificação

A cada mudança de estado ou geração de artefato, valide autonomamente:
- [ ] O artefato possui metadados válidos (`UserFacing: true`, `RequestFeedback` adequado)?
- [ ] O artefato contém orientações claras sobre como interagir usando os botões da IDE?
- [ ] Os cenários de teste contêm sintaxe BDD pura (`Dado...`, `Quando...`, `Então...`)?
- [ ] A nota do Obsidian final foi direcionada para `01-concepcao/bdd-[feature-slug].md` acionando a skill `grafo`?
- [ ] O commit semântico final da Fase 1 foi consolidado acionando a skill `git` (Modo 2)?
