---
name: "review-security"
description: "OWASP security audit on git diff: detects secret leaks, injection flaws, IDOR/BPOA, PII exposure, and unhandled exception disclosure."
---

# Skill: Security & OWASP Review (`skills/review-security`)

Surgically audits branch code changes from an offensive and defensive security perspective (aligned with OWASP Code Review Guide v2, OWASP Top 10, and ASVS).
Operates strictly in **Script-First** mode: runs automated sink scanner first, then focuses manual inspection on flagged lines and business logic.

## Review Pillars (Script-First & Code Crawling)
* **Automated Code Crawling (`scan_sinks.py`):** Scans for dangerous sinks (eval, command injection, insecure deserialization, SQL concatenation, path traversal).
* **Secret Management & SCA:** Detects hardcoded credentials, API keys, tokens, or vulnerable dependencies.
* **Access Control & Concurrency:** Server-side ownership validation (`user_id = current_user.id`) and prevention of Race Conditions / TOCTOU.
* **Modern Web Vectors:** Protection against CSRF, Open Redirects, and permissive CORS with credentials.
* **Cryptography & CSPRNG:** Enforces cryptographically secure pseudo-random generators (`secrets`, `crypto`, `Random.secure()`) for sensitive tokens.
* **Data Privacy (LGPD / GDPR) & Log Injection:** Masks PII and neutralizes CRLF log injection (`\r\n`).
* **Exception Handling & Fail-Safe Defaults:** Generic client error payloads without leaking stack traces or failing open.

## Available Resources
* **Automated Scanner:** [`scripts/scan_sinks.py`](./scripts/scan_sinks.py)
* **Checklist:** [`references/checklist_security.md`](./references/checklist_security.md)
* **Artifact Template:** [`resources/template_security.md`](./resources/template_security.md)
