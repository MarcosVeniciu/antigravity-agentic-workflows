---
name: "artefatos"
description: "Skill de geração de artefatos de implementação e arquitetura SDD (Fase 2). Traduz especificações BDD em diagramas UML Mermaid, contratos tipados e análise de impacto via artefatos interativos."
---

# Skill: Geração de Artefatos & Desenho de Arquitetura SDD (`skills/artefatos`)

Gerencia a **Fase 2 (Desenho Técnico & Contratos SDD)** preenchendo o abismo entre os requisitos BDD e o desenvolvimento de código através da geração de artefatos interativos com interrupções para aprovação direta na IDE.

---

## 🔄 Fluxo Operacional

Consulte as referências e templates para cada etapa do fluxo:

1. **Pre-flight & Leitura de Contexto**:
   * Busque no Obsidian Vault a especificação de escopo gerada na Fase 1 (`01-concepcao/bdd-[feature-slug].md`).
   * Leia as regras de arquitetura em `05-architecture-map/` e `04-domain-rules/`.
   * Identifique a branch Git ativa.

2. **Geração do Desenho Técnico (SDD)**:
   * Consulte o guia detalhado em [references/sdd_execution.md](references/sdd_execution.md) para construir o plano de implementação, diagramas e mocks de contrato.
   * Utilize a estrutura base do template em [resources/template_artefatos.md](resources/template_artefatos.md).
   * Gere o artefato interativo `implementation_plan.md` no diretório da sessão com `UserFacing: true` e **`RequestFeedback: true`**.

3. **Pausa Interativa & Aprovação do Usuário**:
   * O artefato gerado apresentará o botão **Proceed** no painel visual da IDE.
   * O assistente aguarda a confirmação/feedback do usuário antes de prosseguir para a gravação no Vault.

4. **Persistência no Obsidian Vault & Handover**:
   * Salve o conteúdo do plano aprovado no vault em `01-concepcao/sdd-[feature-slug].md` (ou `05-architecture-map/`) acionando a skill `grafo`.
   * Adicione o link bidirecional para o escopo BDD originário (`[[bdd-feature-slug]]`).
   * Acione a skill `git` (Modo 2 - Phase Squash) para consolidar a fase em um commit semântico limpo.
   * Apresente ao usuário a instrução da próxima etapa (sugerir `/testes` ou `/infra`).

---

## 🛠️ Recursos & Referências

* **Template do Artefato**: [resources/template_artefatos.md](resources/template_artefatos.md)
* **Manual de Execução SDD & Diagramas**: [references/sdd_execution.md](references/sdd_execution.md)

---

## ⛔ Regras Universais & Restrições

1. **Think First, Code Later**: Proibido escrever código-fonte de produção ou criar suítes de testes nesta fase.
2. **Consultar o Vault (Pre-flight Check)**: Toda decisão de design deve se fundamentar nas regras e mapas já registrados no Obsidian.
3. **Controle Interativo via Artefatos**: Sempre defina `RequestFeedback: true` ao emitir o `implementation_plan.md`.
4. **Sintaxe Segura em Mermaid**: Utilize aspas em todos os rótulos de nós em diagramas Mermaid para evitar erros de renderização.

---

## ✅ Checklist de Validação & Método de Verificação

A cada geração de artefato, valide autonomamente:
- [ ] O artefato `implementation_plan.md` possui metadados válidos (`UserFacing: true`, `RequestFeedback: true`)?
- [ ] O plano sequencial possui o quê, por quê, critérios de aceite e dependências para cada etapa?
- [ ] Os diagramas Mermaid utilizam rótulos entre aspas e correspondem a componentes reais da aplicação?
- [ ] Foram definidos mocks de contratos tipados (Pydantic, Zod, OpenAPI)?
- [ ] A análise de impacto inclui todos os arquivos e módulos afetados?
- [ ] O salvamento final no Obsidian contém link bidirecional via skill `grafo`?
- [ ] O commit semântico final da fase de artefatos foi consolidado via skill `git` (Modo 2)?
