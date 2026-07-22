# Checklist: Security Review (OWASP v2.0 & ASVS Aligned)

This document guides the audit and surgical fix of security vulnerabilities, injection flaws, input sanitization, secret leaks, SCA, LGPD logging, and error disclosure.

---

## 🔄 Phase 1 — Audit (Locating Evidence)

### 1. Gestão de Segredos & SCA (Software Composition Analysis)
* Verify if new dependencies introduced in PR/lockfile contain known CVEs.
* Scan diff for hardcoded passwords, API keys, tokens, or private certificates.
* Ensure sensitive configuration is loaded via environment variables or secret vaults.

### 2. Autenticação & Gestão de Sessão
* Verify authentication mechanisms do not expose specific credential failures on login.
* Ensure session tokens use secure flags (`HttpOnly`, `Secure`, `SameSite`).

### 3. Autorização & Controle de Acesso (BPOA / IDOR)
* Verify authorization is checked server-side on every endpoint and sensitive operation.
* Ensure resource IDs (e.g. `/api/orders/{id}`) validate ownership against authenticated user (`user_id = current_user.id`).

### 4. Validação de Entradas & Sanitização (Injection & XSS)
* Locate SQL/NoSQL injection risks from string concatenation.
* Check OS execution (`subprocess`, `os.system`) for unsanitized inputs or missing list arguments.
* Verify user inputs rendered in responses pass through HTML encoding/sanitization.

### 5. Proteção de Dados & Privacidade (LGPD / GDPR)
* Ensure PII data (CPF, email, bank details) is encrypted in transit (TLS 1.2+) and at rest.
* Verify no excessive PII collection or retention exists in modified flows.

### 6. Registro, Auditoria & Tratamento de Erros (Logging & Info Disclosure)
* Verify sensitive security events (auth failure, privilege change, transactions) produce audit logs.
* Ensure NO sensitive data (passwords, tokens, PII) is written to logs or stdout.
* Verify exceptions return generic error messages to clients without leaking stack traces or internal DB details.

---

## 🛠️ Phase 2 — Surgical Application
* Replace string concatenation with ORM parameterized queries.
* Use `subprocess.run(["cmd", "arg"], shell=False)` to mitigate Command Injection.
* Add ownership validation to queries (`user_id = current_user.id`).
* Move secrets to `os.getenv()` or vault and apply masking to PII in logs.
* Catch exceptions gracefully and return generic user error payloads while logging full details internally.

