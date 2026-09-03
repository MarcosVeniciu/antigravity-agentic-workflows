# 🏛️ Auditoria de Arquitetura & Acoplamento

**Feature:** `{{FEATURE_SLUG}}` | **Branch:** `{{BRANCH_NAME}}`  
**Escopo Analisado:** Diff relativo a `develop` (`{{FILES_COUNT}}` arquivos)

---

## 🔍 Evidências Identificadas no Diff

| Arquivo / Linha | Padrão / Princípio Violado | Causa / Risco |
| :--- | :--- | :--- |
| `{{FILE}}:{{LINE}}` | Inversão de Dependência / Acoplamento | Instanciação direta de dependência externa |

---

## 🛠️ Correções Cirúrgicas Aplicadas
- [x] Injeção de dependência aplicada via construtor.
- [x] Remoção de acoplamento direto com infraestrutura.

---

## 🚦 Validação & Testes
- [x] 100% dos testes unitários verdes após as correções.
- [x] Micro-checkpoint registrado via `skills/git` (Modo 2).
