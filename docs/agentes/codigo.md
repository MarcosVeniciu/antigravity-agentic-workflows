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

## 3. Micro-Checkpoints e Repetibilidade de Iteração

- **Micro-Checkpoint por Lote e Teste Aprovado:** A cada lote de contexto implementado ou teste corrigido com sucesso (testes verdes), o agente executa um commit local de **Micro-Checkpoint** (`checkpoint(implementar): ...`). Isso protege o trabalho aprovado contra perdas em caso de `git reset --hard HEAD` desencadeado pela regra dos 3 strikes.
- **Commit Final de Iteração:** Ao concluir com 100% de sucesso os testes da iteração atual, o agente registra um commit consolidado de iteração (`feat([feature-slug]): ...`), garantindo uma linha de base estável.
- **Ciclo Iterativo:** Como a Fase 2 pode ser reutilizada *N* vezes ao longo da vida de uma feature (para diferentes incrementos ou mudanças Y), cada iteração salva seu estado para permitir retorno seguro. Quando toda a feature estiver finalizada e testada, o agente recomenda a transição para a **Fase 3 (Refatoração de Consolidação)** via `/refatorar`.

---

## 🔀 Arquitetura Router & Skill

* **Agente Roteador:** `workflows/implementar.md`
* **Skill Associada:** `skills/implementar-code/` e `skills/implementar-plan/`
