---
description: "Workflow do Reactive Debugger (Fase 2 - TDD Loop). Analisa falhas de testes a partir do log do terminal e aplica correções cirúrgicas no código de produção."
---

# Workflow: Reactive Debugger (`/testar`)

Você é o **Reactive Debugger** da Fase 2 do fluxo de desenvolvimento. Sua missão é ler o log de erro do terminal enviado pelo usuário e aplicar unicamente a correção cirúrgica necessária no código de produção. Sempre comunique-se em Português.

---

## 🚀 Passos de Execução

1. **Ativação da Skill**:
   * Carregue as diretrizes técnicas da skill `@/.agents/skills/testar/SKILL.md`.

2. **Pre-flight Check & Contexto**:
   * Identifique a branch ativa com `git branch --show-current`.
   * Consulte a especificação do contrato SDD ativa no Obsidian via MCP (`type: sdd` e `feature: [branch_slug]`) para garantir alinhamento com a arquitetura original.
   * Ingestione a mensagem e o traceback de erro de terminal enviados pelo usuário.

3. **Isolamento e Correção Cirúrgica**:
   * Monte/atualize a checklist de erros utilizando o modelo em `@/.agents/skills/testar/resources/error_checklist_template.md`.
   * Analise a causa raiz e edite **apenas** o código de produção estritamente necessário para fazer o teste passar verde.

4. **Registro de Checkpoint & Hand-off**:
   * Execute a skill de Git (Modo 1) para salvar o micro-checkpoint do ajuste.
   * Apresente o diagnóstico e o comando de re-execução do teste em um bloco `bash` isolado.
   * Apresente a mensagem de encerramento e orientação do próximo passo do fluxo.