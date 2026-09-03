# 🛡️ Auditoria de Segurança (OWASP & ASVS)

**Feature:** `{{FEATURE_SLUG}}` | **Branch:** `{{BRANCH_NAME}}`  
**Escopo Analisado:** Diff relativo a `develop` (`{{FILES_COUNT}}` arquivos)

---

## 🔍 Vulnerabilidades Identificadas no Diff

| Arquivo / Linha | Categoria OWASP | Gravidade | Descrição do Risco |
| :--- | :--- | :--- | :--- |
| `{{FILE}}:{{LINE}}` | Injeção / Segredos / IDOR | Alta / Média | Descrição |

---

## 🛠️ Mitigações Aplicadas
- [x] Parametrização estrita de consultas / chamadas seguras.
- [x] Segredos movidos para variáveis de ambiente.
- [x] Mascaramento de dados sensíveis em logs.

---

## 🚦 Validação & Testes
- [x] 100% dos testes unitários verdes após as correções.
- [x] Micro-checkpoint registrado via `skills/git` (Modo 2).
