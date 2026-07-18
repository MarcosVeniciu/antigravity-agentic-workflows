# Agente de Planejamento (`/planejamento`) - O Maestro do Escopo

O agente de planejamento atua na **Fase 1 (Concepção & Contratos)** do ciclo de desenvolvimento do **Antigravity IDE**. Sua função principal é garantir o entendimento absoluto do problema e a definição clara dos limites da funcionalidade antes da escrita de qualquer código de produção.

Ele opera desacoplado do modelo core através do agente roteador `agents/planejamento.md` e da skill `skills/planejamento/`.

---

## 1. Fluxo de Ativação (`/planejamento` + `/grill-me`)

O planejamento é um processo investigativo acionado explicitamente quando o desenvolvedor traz uma nova solicitação ou funcionalidade.

**Processo:**
1. **Varredura de Contexto:** A IA consulta as diretrizes em `prompts/gemini.md` e a base de conhecimento operacional no Obsidian Vault via MCP (`obsidian_knowledge_graph`).
2. **Entrevista Técnica (`/grill-me`):** Em vez de alucinar requisitos omissos, a IA aplica a técnica de entrevista direta, formulando perguntas objetivas para esclarecer regras de negócio e ambiguidades.
3. **Contextualização Git:** O agente executa comandos de leitura (`git branch --show-current`) para situar a funcionalidade na estratégia de ramificação atual.

---

## 2. Fase de Análise e Debate

Com base no contexto coletado:
* **Apresentação de Opções:** A IA aponta lacunas no escopo e propõe pelo menos duas abordagens arquiteturais distintas.
* **Refinamento:** O usuário escolhe ou refina a proposta até alcançar consenso.
* **Confirmação Executiva:** Quando o plano se consolida, o usuário confirma o avanço.

---

## 3. Consolidação BDD e Handover

Com o escopo aprovado:
1. **Especificação BDD:** O agente consolida os casos de uso no formato BDD (*Given / When / Then*), utilizando os templates da skill `skills/planejamento/resources/template_planejamento.md`.
2. **Artefato de Transição (`implementation_plan.md`):** O plano é apresentado na IDE como um artefato interativo com `RequestFeedback: true` para aprovação final.
3. **Persistência no Obsidian Vault:** Após aprovação, a especificação é gravada em `01-concepcao/bdd-[feature-slug].md` no vault com a tag `#phase/concepcao` e `type: bdd`.
4. **Handover para Artefatos:** Com o escopo BDD garantido no vault, o fluxo avança para a especificação técnica formal (`/artefatos`).

---

## 🔀 Arquitetura Router & Skill

* **Agente Roteador:** `agents/planejamento.md`
* **Skill Associada:** `skills/planejamento/`
* **Referências de Execução:** `skills/planejamento/references/` (STATE1-DEBATE, STATE2-BRANCH_STRATEGY, STATE3-SCOPE_CLOSURE, STATE4-ARCHIVING)
