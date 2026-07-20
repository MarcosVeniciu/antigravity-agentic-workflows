---
name: "review"
description: "Executa auditorias metódicas de código e aplica correções cirúrgicas em duas fases: Fase 1 (Auditoria) e Fase 2 (Correção)."
---

# Skill: Review & Audit Resolution

Esta skill guia as regras técnicas e limitações para as auditorias de qualidade.

## 🎯 Domínios e Progressive Disclosure
Acesse os recursos abaixo sob demanda (via `view_file`) dependendo do escopo acionado:
* **Geral**: `resources/template_geral.md` | `references/checklist_geral.md`
* **Arquitetura**: `resources/template_arquitetura.md` | `references/checklist_arquitetura.md`
* **Segurança**: `resources/template_seguranca.md` | `references/checklist_seguranca.md`
* **Performance**: `resources/template_performance.md` | `references/checklist_performance.md`
* **Resiliência**: `resources/template_resiliencia.md` | `references/checklist_resiliencia.md`

## ⛔ Strict Constraints (Regras Absolutas)
* **Fase 1 (Auditoria)**: É terminantemente proibido modificar o código-fonte da aplicação. O papel é inspecionar e gerar o `audit_report.md` com `RequestFeedback: true`.
* **Fase 2 (Correção)**:
  * 🚫 **Testes Intocáveis**: A suíte de testes não pode ser modificada para forçar aprovação.
  * 🚫 **Regras de Negócio**: Estritamente proibido alterar o domínio. Foque apenas na infraestrutura da correção (ex: injeção de dependência, sanitização OWASP).
  * 🚫 **Sem Execução Autônoma**: Forneça comandos de teste em blocos `bash` isolados.

## ✅ Verification Method (Como Validar)
* O relatório do Vault (`02-auditorias/audit-[feature-slug].md`) deve ser atualizado usando `vault_patch` com `targetType: "heading"` ou `"frontmatter"` para marcar itens com `[x]`.
* Um commit de squash semântico deve ser gerado antes de redirecionar o usuário com o bloco `[NEXT STEP]`.