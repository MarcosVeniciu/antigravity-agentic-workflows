# Agente de Artefatos (`/artefatos`) - O Arquiteto Técnico

O agente de **Artefatos** atua no momento de transição entre *o que o sistema deve fazer* (estabelecido em BDD na Fase 1) e *como o sistema será estruturado tecnicamente* (formalizado em SDD).

Sua responsabilidade é traduzir a lista de funcionalidades e regras de negócio em um plano de implementação detalhado e diagramas de arquitetura, sem escrever código de produção.

---

## 1. Abordagem SDD (Software Design Document)

A premissa central é eliminar a sobrecarga cognitiva e o guessing durante a etapa de codificação:

- **Diagramação:** Criação de diagramas visuais em Mermaid.js (Sequência, Classe, Fluxograma, ER) mapeando a integração dos componentes.
- **Definição de Contratos:** Especificação rigorosa de interfaces, DTOs, schemas de banco de dados (ex: Pydantic/Zod) e payloads de API.
- **Análise de Impacto:** Mapeamento explícito de quais módulos e arquivos existentes serão alterados pela nova funcionalidade, evitando regressões.

---

## 2. Artefato de Plano de Implementação

O agente gera o artefato interativo `implementation_plan.md` (utilizando os templates de `skills/artefatos/resources/`), organizando o trabalho em etapas atômicas:
- **Arquivo Alvo:** Qual arquivo será criado ou modificado (`[NEW]`, `[MODIFY]`, `[DELETE]`).
- **Justificativa:** Ligação direta com os requisitos do BDD.
- **Critérios de Aceite:** Condições verificáveis de término.
- **Dependências:** O que precisa existir antes do arquivo ser tocado.

---

## 3. Rastreabilidade e Segunda Mente (Obsidian Vault)

Após a aprovação do usuário no plano de implementação:
1. O agente salva o SDD consolidado no Obsidian Vault na pasta `01-concepcao/sdd-[feature-slug].md`.
2. Garante metadados completos (`type: sdd`, `feature: [slug]`, `tags: [#plan_implement]`) e links bidirecionais apontando para a nota BDD de origem.
3. Este registro valida o **Portão de Fase 1 ➔ 2** (Phase Gate), liberando o início do loop TDD no próximo chat.

---

## 🔀 Arquitetura Router & Skill

* **Agente Roteador:** `agents/artefatos.md`
* **Skill Associada:** `skills/artefatos/`
* **Referências de Execução:** `skills/artefatos/references/EXECUTION.md`
