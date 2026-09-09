# Tarefas: {{FEATURE_TITLE}}

**Feature:** `{{FEATURE_SLUG}}` | **Branch:** `{{BRANCH_NAME}}`
**SDD Ref:** `[[01-concepcao/sdd-{{FEATURE_SLUG}}.md]]`
**Status Geral:** Em Progresso (Fase 2 - TDD)

---

## Lote 1: {{LOTE_1_NOME}}
- [ ] Criar testes unitários `tests/unit/test_{{COMPONENTE_A}}.py` (Red) — cenários Happy Path e Edge Cases
- [ ] Criar/Modificar `src/{{PATH_COMPONENTE_A}}.py` (Green) — implementação de {{COMPONENTE_A}} e contratos
- [ ] Executar e validar testes unitários do lote (100% verde)
- [ ] Salvar micro-checkpoint `checkpoint(implement): lote 1 concluído`

---

## Lote 2: {{LOTE_2_NOME}}
- [ ] Criar testes unitários `tests/unit/test_{{COMPONENTE_B}}.py` (Red) — cenários com mock de {{COMPONENTE_A}}
- [ ] Criar/Modificar `src/{{PATH_COMPONENTE_B}}.py` (Green) — extensão e consumo dos contratos
- [ ] Executar e validar testes unitários do lote (100% verde)
- [ ] Salvar micro-checkpoint `checkpoint(implement): lote 2 concluído`

---

## Conclusão da Fase 2 (TDD)
- [ ] Executar suíte unitária completa (`pytest -v tests/unit/`)
- [ ] Atualizar linha do tempo em `01-concepcao/dod-{{FEATURE_SLUG}}.md`
- [ ] Micro-checkpoint final da Fase 2 via `skills/git` (Modo 2)
