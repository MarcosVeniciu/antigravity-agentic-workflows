# Checklist: Security Review (OWASP Top 10)

This document guides the audit and surgical fix of security vulnerabilities, injection flaws, input sanitization, and secret leaks.

---

## 🔄 Phase 1 — Audit (Locating Evidence)
* Search for SQL/NoSQL injection via f-string concatenation or generic strings.
* Check OS calls (`subprocess`, `os.system`) without safe list arguments.
* Map unauthenticated endpoints or IDOR issues (lack of `user_id` filtering).
* Locate hardcoded passwords, API keys, or tokens in variables or logs.

---

## 🛠️ Phase 2 — Surgical Application
* Replace string concatenation with ORM parameterized queries.
* Use `subprocess.run(["cmd", "arg"], shell=False)` to mitigate Command Injection.
* Add ownership validation to queries (`user_id = current_user.id`).
* Move secrets to `os.getenv()` and apply masking to PII in logs.

