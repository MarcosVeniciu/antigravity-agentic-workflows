# Checklist: Security Review (OWASP Code Review Guide v2 & ASVS Aligned)

This document guides the audit and surgical fix of security vulnerabilities, injection flaws, input sanitization, secret leaks, SCA, LGPD logging, race conditions, and modern web attack vectors.

---

## ⚡ Phase 0 — Script-First Automated Crawling (MANDATORY)
Before performing any manual code reading, run the automated sink scanner against the modified files:
```bash
python skills/review-security/scripts/scan_sinks.py <modified_files>
```
* **Output Evaluation:** If any `🔴 [HIGH]` or `🟡 [MEDIUM]` alerts are reported, prioritize immediate investigation on those specific files and line numbers.
* **Call Hierarchy:** If flagged lines receive untrusted parameters from upstream callers, trace the call hierarchy (1 level up/down) to verify sanitization.

---

## 🔄 Phase 1 — Audit (Locating Evidence)

### 1. Gestão de Segredos & SCA
* Verify if new dependencies introduced in PR/lockfile contain known CVEs.
* Scan diff for hardcoded passwords, API keys, tokens, or private certificates.
* Ensure sensitive configuration is loaded via environment variables or secret vaults.

### 2. Autenticação & Gestão de Sessão
* Verify authentication mechanisms do not expose specific credential failures on login.
* Ensure session tokens use secure flags (`HttpOnly`, `Secure`, `SameSite=Strict/Lax`).
* Ensure session tokens are regenerated upon login (session fixation defense) and invalidated on logout.

### 3. Autorização & Controle de Acesso (BPOA / IDOR)
* Verify authorization is checked server-side on every endpoint and sensitive operation.
* Ensure resource IDs (e.g. `/api/orders/{id}`) validate ownership against authenticated user (`user_id = current_user.id`).

### 4. Validação de Entradas & Sanitização (Injection & XSS)
* Locate SQL/NoSQL injection risks from string concatenation or string interpolation.
* Check OS execution (`subprocess`, `Process.run`, `child_process`) for missing argument lists or `shell=True`.
* Verify user inputs rendered in responses pass through contextual HTML encoding or DOMPurify.

### 5. Race Conditions & Concorrência (TOCTOU - OWASP Cap. 23)
* Identify Check-then-Act patterns without transactional row locks (e.g. checking balance before debiting).
* Ensure critical balance, inventory, and voucher mutations use database-level locking (`SELECT FOR UPDATE`, atomic decrement, or optimistic version checks).
* Avoid shared mutable state in singleton services without thread synchronization.

### 6. Vetores Web Modernos: CSRF, CORS & Open Redirects
* Ensure state-changing operations (POST/PUT/DELETE) enforce anti-CSRF token verification or strict SameSite cookie policies.
* Verify CORS configuration does not combine wildcard origins (`*`) with `allow_credentials=True`.
* Inspect redirect destinations: reject external domains unless strictly validated against an internal allowlist.

### 7. Criptografia & Entropia (CSPRNG - OWASP Cap. 12)
* Ensure security tokens, OTPs, session identifiers, and password reset nonces use CSPRNG (`secrets` in Python, `crypto.randomUUID()` in JS/TS, `Random.secure()` in Dart).
* Never allow `random.random()` or `Math.random()` to generate cryptographic or authentication artifacts.

### 8. Proteção de Dados, Privacidade & Log Injection (LGPD / OWASP Cap. 19)
* Ensure PII data (CPF, email, bank details) is encrypted in transit (TLS 1.2+) and at rest.
* Verify NO sensitive data (passwords, tokens, PII) is written to application logs.
* Sanitize carriage returns and line feeds (`\r`, `\n`) from user inputs logged to stdout to prevent Log Injection / Forgery.

### 9. Registro, Auditoria & Tratamento de Erros (OWASP Cap. 20)
* Verify sensitive security events (auth failure, privilege change, transactions) produce audit logs.
* Verify exceptions return generic error messages to clients without leaking stack traces or internal DB details (Fail Securely).

---

## 🛠️ Phase 2 — Surgical Application
* Replace string concatenation with ORM parameterized queries.
* Use argument lists without shell: `subprocess.run(["cmd", "arg"], shell=False)`.
* Add row-level locks or atomic operations to eliminate TOCTOU race conditions: `query.with_for_update()`.
* Add ownership validation to queries (`user_id = current_user.id`).
* Enforce CSPRNG via `import secrets` or `crypto.randomUUID()`.
* Validate redirect targets strictly against relative paths (`url.startswith('/') and not url.startswith('//')`).
* Move secrets to `os.getenv()` or vault and apply masking to PII in logs.
* Catch exceptions gracefully and return generic user error payloads while logging full details internally.
