---
name: "review-seguranca"
description: "Security and OWASP vulnerability review skill. Audits git diff for secret leaks, injection flaws, IDOR/BPOA, PII exposure (LGPD), and unhandled exception disclosure."
---

# Skill: Review de Segurança & OWASP (`skills/review-seguranca`)

Audita cirurgicamente as alterações de código da branch sob a ótica de segurança ofensiva e defensiva (alinhado a OWASP Top 10 e ASVS).

## 🎯 Eixos de Análise (Diff-Based)
* **Gestão de Segredos & SCA:** Busca de senhas hardcoded, chaves de API, certificados ou tokens expostos no diff.
* **Validação de Entrada & Injeções:** SQL/NoSQL injections, Command injection e XSS.
* **Controle de Acesso (IDOR / BPOA):** Validação de posse do recurso (`user_id = current_user.id`).
* **Proteção de Dados & Privacidade (LGPD):** Mascaramento de dados sensíveis e proibição de PII em logs.
* **Tratamento de Exceções:** Retorno de mensagens genéricas para clientes sem vazar stack traces.

## 📋 Available Resources
* **Checklist:** `references/checklist_seguranca.md` from the `@review-seguranca` skill.
* **Template do Artefato:** `resources/template_seguranca.md` from the `@review-seguranca` skill.
