---
name: "review-resilience"
description: "Resilience audit on git diff: verifies I/O timeouts, circuit breakers, exponential backoff retries, and graceful fallbacks."
---

# Skill: Resilience & Fault Tolerance Review (`skills/review-resilience`)

Surgically audits branch code changes from the perspective of operational robustness, distributed failures, and graceful degradation.

## 🎯 Review Pillars (Diff-Based)
* **Mandatory Timeouts:** Every network call (HTTP, gRPC, database, queues) must have an explicitly defined timeout.
* **Retry Policies with Exponential Backoff:** Smart retries with exponential backoff and jitter to prevent thundering herd problems.
* **Circuit Breakers & Fallbacks:** Graceful degradation when external services (e.g., LLM APIs, payment gateways) become unavailable.
* **Concurrency Handling:** Deadlocks, race conditions, and optimistic vs pessimistic locking.

## 📋 Available Resources
* **Checklist:** `references/checklist_resilience.md` from the `@review-resilience` skill.
* **Artifact Template:** `resources/template_resilience.md` from the `@review-resilience` skill.
