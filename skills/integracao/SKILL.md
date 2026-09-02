---
name: "integracao"
description: "Integration testing and E2E verification skill. Orchestrates multi-step integration test suites with structured terminal banners (Happy, Unhappy, Resilience)."
---

# Skill: Testes de Integração & Verificação E2E (`skills/integracao`)

Orquestra e executa suítes de testes de integração e ponta a ponta (E2E) no ambiente consolidado da release branch, garantindo que múltiplas features coexistam sem quebras funcionais.

## 🎯 Padrão de Execução por Etapas com Banners

Os testes de integração devem emitir logs estruturados no terminal com banners claros para cada etapa de validação:

```text
[ETAPA 1] E2E HAPPY PATH: Fluxo Nominal Completo (Ex: Login -> Cadastro -> Execução -> Persistência)
[ETAPA 2] UNHAPPY PATH: Teste de Acesso Sem Autenticação (403 Forbidden)
[ETAPA 3] UNHAPPY PATH: Credenciais Incorretas / Erro de Autenticação (401 Unauthorized)
[ETAPA 4] UNHAPPY PATH: Rejeição de Entidades Duplicadas (409 Conflict)
[ETAPA 5] UNHAPPY PATH: Rejeição de Validação de Dados / Schemas Inválidos (422 Unprocessable Entity)
[ETAPA 6] UNHAPPY PATH: Resiliência e Degradação Graciosa sob Falha Externa (HTTP 200 via Fallback)
```

## 📋 Available Resources
* **Padrões de Runner E2E:** `references/e2e_runner_pattern.md` from the `@integracao` skill.
* **Template do Relatório de Integração:** `resources/template_integration_log.md` from the `@integracao` skill.
