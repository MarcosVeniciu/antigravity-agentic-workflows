# Agente de Aplicação de Correções de Auditoria (`/aplicar-review`)

O agente `/aplicar-review` é o braço executor da Fase 3 de auditoria. Enquanto o `/review` identifica as vulnerabilidades e oportunidades de melhoria, o `/aplicar-review` aplica as correções cirúrgicas no código.

---

## 1. Execução Cirúrgica

1. **Leitura do Relatório:** O agente analisa o arquivo `audit_report_[tipo].md` gerado na etapa de auditoria.
2. **Foco Atômico via `task.md`:** Cria um checklist com os pontos apontados e resolve um item por vez (`[/] -> [x]`).
3. **Preservação de Comportamento:** Aplica correções de segurança, performance ou arquitetura sem alterar contratos de negócio ou alterar a suíte de testes funcionais.

---

## 2. Atualização de Evidências no Vault

- À medida que resolve cada item, atualiza os checkboxes e os campos de resolução no artefato `audit_report_[tipo].md`.
- Sincroniza o status final da auditoria no arquivo permanente do Obsidian Vault (`02-auditorias/audit-[feature-slug].md`).
- Instruir o desenvolvedor a rodar os testes (`/testar`) para garantir que nenhuma alteração de auditoria introduziu regressões.

---

## 🔀 Arquitetura Router & Skill

* **Integrado à Skill de Review:** `skills/review/` (Fase 2 de Aplicação de Ajustes) e acionável via `/aplicar-review` ou opção no agente `agents/review.md`.
