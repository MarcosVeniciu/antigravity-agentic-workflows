Listed directory examples
Viewed debate_rules.md:1-10
Viewed template_planejamento.md:1-29
Listed directory resources
Listed directory scripts
Listed directory references
Listed directory examples
Viewed template_artefatos.md:1-84
Viewed template_dod.md:1-47
Viewed planejamento_de_ajustes_fluxo.md:90-115
Edited planejamento_de_ajustes_fluxo.md

O detalhamento físico de arquivos da **Fase 1 (Concepção & Arquitetura)** já está documentado na **Seção 5.4** do [planejamento_de_ajustes_fluxo.md](file:///e:/Codigos/antigravity-agentic-workflows/planejamento_de_ajustes_fluxo.md).

Aqui está o raio-x exato de cada arquivo que será criado, modificado e removido:

---

### 1. Workflow: [workflows/planejamento.md](file:///e:/Codigos/antigravity-agentic-workflows/workflows/planejamento.md) `[MODIFICAR]`
Unifica toda a Fase 1 (Chat 1). Ele não terá regras técnicas duplicadas, apenas orquestrará a esteira e recomendará as skills:

```markdown
---
title: "Concepção & Arquitetura Agent"
description: "Orquestra a Fase 1 (Chat 1): debate socrático, Git Flow, especificação BDD, blueprint SDD e criação do Living DoD."
---

# Agent: Concepção & Arquitetura (`/planejamento`)

## Restrição Universal
* **Zero Código de Produção**: Estritamente proibido criar código de aplicação (.py, .ts, etc.) ou testes funcionais nesta fase.

## Esteira de Execução em 5 Etapas

### Etapa 1: Debate Socrático & Propostas de Escopo
- Conduza a entrevista técnica avaliando impactos, gargalos e trade-offs.
- 💡 **Skill Recomendada:** `skills/debate`
- Gere o artefato `propostas_planejamento.md` (`RequestFeedback: true`) com Abordagem Recomendada vs Alternativa.
- **Pausa de Validação:** Se o usuário fizer comentários, refine a proposta. Somente avance após clique no botão **Proceed** ou aprovação explícita.

### Etapa 2: Estratégia de Branch (Git Flow)
- Com o slug da feature definido, valide que o repositório não está em `main` ou `develop`.
- 💡 **Skill Recomendada:** `skills/git` (Modo 1: Git Flow & Branch Strategy)
- Proponha a criação/checkout do ramo: `git checkout -b feature/[slug]`.

### Etapa 3: Especificação Comportamental (BDD)
- Modele os requisitos exclusivamente em sintaxe Gherkin pura (`Given/When/Then`).
- 💡 **Skill Recomendada:** `skills/bdd`
- Salve o documento em `01-concepcao/bdd-[slug].md`.

### Etapa 4: Arquitetura Técnica (SDD)
- Traduza os cenários BDD em diagramas Mermaid protegidos, contratos tipados/mocks e matriz de impacto em arquivos.
- 💡 **Skill Recomendada:** `skills/sdd`
- Salve o documento em `01-concepcao/sdd-[slug].md`.

### Etapa 5: Criação do Living DoD & Handover de Fase
- Inicialize o registro vivo de histórico e critérios de aceite.
- 💡 **Skill Recomendada:** `skills/dod`
- Salve o arquivo em `01-concepcao/dod-[slug].md`.
- Consolide as especificações geradas em um commit semântico via `skills/git` (Modo 3 - Phase Squash):
  `git commit -m "docs(concepcao): especificações BDD, SDD e DoD para [slug]"`
- Imprima a recomendação de encerramento de chat:
  > **[NEXT STEP]** ➡️ *"🏗️ Fase 1 concluída com sucesso! Por favor, abra um **NOVO CHAT (Chat 2)** e execute `/implementar` para iniciar o ciclo de TDD."*
```

* **Workflow a ser Removido:** `workflows/artefatos.md` (suas etapas foram absorvidas pelas etapas 4 e 5 acima).

---

### 2. Detalhamento das Skills da Fase 1

#### A. `skills/debate/` `[NOVA]`
* **Responsabilidade Única (SRP):** Conduzir a inquirição socrática de escopo, levantar riscos e gerar o artefato comparativo de propostas.
* **Arquivos:**
  * `SKILL.md`: Painel de controle, instruindo o modelo a ativar o modo socrático (`/grill-me`), questionar acoplamento com o legado e montar a matriz de trade-offs.
  * `resources/debate_rules.md`: Critérios de inquirição (estado do sistema, volumetria/performance, edge cases).
  * `resources/template_propostas.md`: Template padrão para o artefato `propostas_planejamento.md`.

#### B. `skills/git/` `[MODIFICAR]`
* **Responsabilidade Única (SRP):** Central de governança e integridade do repositório local.
* **Ajustes:**
  * Recebe `scripts/validate_branch.sh` (vindo de `skills/planejamento/scripts/`).
  * Atualiza `SKILL.md` e `references/EXECUTION.md` documentando formalmente o **Modo 1: Git Flow & Branch Strategy** (regras de branch, checagem e comando de checkout) junto aos modos já existentes (Micro-checkpoint, Squash e Rollback).

#### C. `skills/bdd/` `[NOVA]`
* **Responsabilidade Única (SRP):** Modelagem de requisitos em cenários Gherkin puros (`Given/When/Then`).
* **Arquivos:**
  * `SKILL.md`: Diretrizes para escrita de cenários comportamentais sem viés de implementação técnica.
  * `resources/template_bdd.md`: Template com frontmatter YAML e tags padronizadas para `01-concepcao/bdd-[slug].md`.
  * `examples/bdd_checkout_example.md`: Exemplo de referência de alto padrão.

#### D. `skills/sdd/` `[NOVA]`
* **Responsabilidade Única (SRP):** Desenho técnico de arquitetura de software (UML, contratos e análise de impacto).
* **Arquivos:**
  * `SKILL.md`: Diretrizes para geração de diagramas de sequência/classe Mermaid seguros e mocks tipados (Zod, Pydantic, TypeScript).
  * `resources/template_sdd.md`: Template para `01-concepcao/sdd-[slug].md` (focado puramente no SDD, sem misturar DoD).
  * `references/sdd_execution.md`: Manual de boas práticas de UML e contratos.
  * `examples/sdd_checkout_example.md`: Exemplo de especificação técnica.
  * `scripts/validate_sdd_contracts.py`: Script de validação automática.

#### E. `skills/dod/` `[NOVA]`
* **Responsabilidade Única (SRP):** Gestão e rastreabilidade da Definition of Done e Living Log.
* **Arquivos:**
  * `SKILL.md`: Regras de estrutura do arquivo `01-concepcao/dod-[slug].md` e procedimentos para conectar os cenários BDD e requisitos não-funcionais aos checklists de aceite.
  * `resources/template_dod.md`: Template padrão das 5 seções do DoD (Requisitos, Linha do Tempo da Fase 2, Refatoração & Auditorias, Docs & Release, Critérios de Aceite).

---

### 3. Remoção de Pastas Legadas
* `skills/planejamento/` ➔ Será deletada após migração dos arquivos para `skills/debate/`, `skills/bdd/` e `skills/git/`.
* `skills/artefatos/` ➔ Será deletada após migração dos arquivos para `skills/sdd/` e `skills/dod/`.

---

### Pergunta para alinhamento:
Podemos prosseguir com a **execução dessas mudanças na Fase 1** (criação das novas skills, atualização da skill de git, reescrita do workflow e limpeza dos arquivos legados), ou você gostaria de revisar algum arquivo específico antes da aplicação?