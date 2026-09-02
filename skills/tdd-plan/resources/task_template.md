# Implementation Task List (`task_list.md`)

**Feature:** `{{FEATURE_SLUG}}` | **Branch:** `{{BRANCH_NAME}}`
**SDD Ref:** `[[01-concepcao/sdd-{{FEATURE_SLUG}}.md]]`
**Status Geral:** Em Andamento (Fase 2 - TDD)

---

## 🎯 Lotes de Execução Contextual

### 📦 Lote de Contexto 1: {{BATCH_1_NAME}}
- [ ] **Testes do Lote (Red):**
  - `tests/unit/test_{{COMPONENT_A}}.py`
- [ ] **Código de Produção (Green):**
  - `src/{{PATH_COMPONENT_A}}.py`
- [ ] **Validação do Lote:** Testes unitários do lote passando 100%.

---

### 📦 Lote de Contexto 2: {{BATCH_2_NAME}}
- [ ] **Testes do Lote (Red):**
  - `tests/unit/test_{{COMPONENT_B}}.py`
- [ ] **Código de Produção (Green):**
  - `src/{{PATH_COMPONENT_B}}.py`
- [ ] **Validação do Lote:** Testes unitários do lote passando 100%.

---

## 🏁 Encerramento da Fase 2
- [ ] Executar suíte completa de testes unitários (`pytest -v -s tests/unit/`)
- [ ] Atualizar linha do tempo no `01-concepcao/dod-{{FEATURE_SLUG}}.md`
- [ ] Salvar micro-checkpoint via `skills/git` (Modo 2)
