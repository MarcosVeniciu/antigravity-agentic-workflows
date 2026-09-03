---
name: "review-security"
description: "OWASP security audit on git diff: detects secret leaks, injection flaws, IDOR/BPOA, PII exposure, and unhandled exception disclosure."
---

# Skill: Security & OWASP Review (`skills/review-security`)

Surgically audits branch code changes from an offensive and defensive security perspective (aligned with OWASP Top 10 and ASVS).

## 🎯 Review Pillars (Diff-Based)
* **Secret Management & SCA:** Scans diff for hardcoded passwords, API keys, private certificates, or vulnerable dependencies.
* **Input Validation & Injections:** SQL/NoSQL injection, Command injection, and Cross-Site Scripting (XSS).
* **Access Control (IDOR / BPOA):** Server-side resource ownership validation (`user_id = current_user.id`).
* **Data Privacy (GDPR / LGPD):** Sensitive data masking and strict prohibition of PII in application logs.
* **Exception Handling:** Returning generic client error payloads without leaking stack traces or internal schema details.

## 📋 Available Resources
* **Checklist:** `references/checklist_security.md` from the `@review-security` skill.
* **Artifact Template:** `resources/template_security.md` from the `@review-security` skill.
