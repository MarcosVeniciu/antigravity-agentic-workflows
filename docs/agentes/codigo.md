# Agente de Código (`/codigo` / `/implementar`) - Desenvolvimento TDD Iterativo (Fase 2)

O agente de **Código / Implementação** atua na **Fase 2 (Desenvolvimento TDD Iterativo)** no Chat 2. Ele é ativado assim que os artefatos da Fase 1 (BDD, SDD e DoD log) estão salvos, atuando para desenvolver testes (Red), código de produção (Green) e apendar entradas dinâmicas na linha do tempo de `01-concepcao/dod-[slug].md`.

---

## 1. Princípio da Lógica Mínima Necessária & Histórico Vivo

O objetivo central deste agente é escrever a **menor quantidade de código funcional** para satisfazer as asserções dos testes existentes (*Make it Work*):

- **Prevenção de Escopo Fantasma:** O agente não implementa métodos adicionais ou abstrações não solicitadas.
- **Redução Cognitiva via Lotes de Contexto (`task_list.md`):** O agente organiza tarefas agrupadas por contexto dependente (Model + Repository + Service).
- **Linha do Tempo Dinâmica no DoD:** A cada sub-mudança implementada com sucesso, o agente apenda um resumo de 1 a 2 frases na Seção 2 (`## 2. Linha do Tempo de Desenvolvimento`) do arquivo `01-concepcao/dod-[feature-slug].md`.

---

## 2. Qualidade Estrutural e Docstrings

- **Docstrings Estruturadas:** Todas as funções e classes recebem docstrings completas (propósito, argumentos, retornos e exceções).
- **Rastreabilidade:** Adiciona referências à nota correspondente no Obsidian quando aplica regras de negócio (`Ref: Obsidian note [[note-name]]`).

---

## 3. Handover e Repetibilidade

Ao final de cada lote de desenvolvimento, se a funcionalidade completa ainda não acabou, o Chat 2 pode ser reutilizado ou reiniciado invocando `/implementar` novamente. Quando toda a feature estiver pronta e funcional, o agente recomenda a transição para a **Fase 3 (Refatoração de Consolidação)** via `/refatorar`.

---

## 🔀 Arquitetura Router & Skill

* **Agente Roteador:** `workflows/implementar.md`
* **Skill Associada:** `skills/implementar-code/` e `skills/implementar-plan/`
