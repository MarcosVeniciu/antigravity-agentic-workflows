# Agente de Artefatos (`/artefatos`) - O Arquiteto Técnico e Gerador do DoD

O agente de **Artefatos** atua no momento de transição entre *o que o sistema deve fazer* (estabelecido em BDD na Fase 1) e *como o sistema será estruturado tecnicamente* (formalizado em SDD e no documento vivo `dod-[slug].md`) no Chat 1.

Sua responsabilidade é traduzir a lista de funcionalidades e regras de negócio em um plano de implementação detalhado, diagramas de arquitetura e o contrato vivo de aceite (DoD), sem escrever código de produção.

---

## 1. Abordagem SDD (Software Design Document)

A premissa central é eliminar a sobrecarga cognitiva e o guessing durante a etapa de codificação:

- **Diagramação:** Criação de diagramas visuais em Mermaid.js (Sequência, Classe, Fluxograma, ER) mapeando a integração dos componentes.
- **Definição de Contratos:** Especificação rigorosa de interfaces, DTOs, schemas de banco de dados (ex: Pydantic/Zod) e payloads de API.
- **Análise de Impacto:** Mapeamento explícito de quais módulos e arquivos existentes serão alterados pela nova funcionalidade, evitando regressões.

---

## 2. Geração do Registro Vivo de Execução & DoD (`dod-[slug].md`)

O agente gera o arquivo `01-concepcao/dod-[feature-slug].md` contendo 5 seções estruturadas:
1. **Requisitos & Arquitetura:** Links para os documentos BDD e SDD.
2. **Linha do Tempo de Desenvolvimento:** Seção dinâmica reservada para o `/implementar` registrar sub-mudanças.
3. **Refatoração & Auditorias:** Checklists das Fases 3 e 4.
4. **Documentação & Release:** Checklists da Fase 5.
5. **Critérios de Aceite Globais:** Cenários BDD e Requisitos Não-Funcionais (NFR).

---

## 3. Rastreabilidade e Segunda Mente (Obsidian Vault)

Após a aprovação do usuário no plano de implementação:
1. O agente salva o SDD consolidado no Obsidian Vault em `01-concepcao/sdd-[feature-slug].md` e o DoD em `01-concepcao/dod-[feature-slug].md`.
2. Garante metadados completos (`type: sdd`, `feature: [slug]`) e links bidirecionais apontando para a nota BDD de origem.
3. Este registro valida o **Portão de Fase 1 ➔ 2** (Phase Gate), liberando o início do desenvolvimento no Chat 2 (`/implementar`).

---

## 🔀 Arquitetura Router & Skill

* **Agente Roteador:** `agents/artefatos.md`
* **Skill Associada:** `skills/artefatos/`
* **Referências de Execução:** `skills/artefatos/references/EXECUTION.md`
