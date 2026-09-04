---
name: "tdd-tests"
description: "TDD Red Phase: writes atomic AAA unit tests with isolated boundary mocks covering Happy Path, Edge Cases, and Exceptions before production code."
---

# Skill: AAA Unit Tests & Mock Isolation (`skills/tdd-tests`)

Generates unit test suites for each context batch during the TDD Red Phase, ensuring behavioral coverage, mock isolation, and zero live I/O to physical databases or network services.

## 🎯 Strict AAA Pattern & Test Coverage Matrix

For each batch, tests must cover:
1. **Happy Path:** Nominal execution flow and expected return states.
2. **Edge Cases:** Boundaries (0, `MAX_INT`), empty strings, nulls, and empty collections.
3. **Exceptions / Domain Errors:** Triggering typed domain exceptions upon invalid input.
4. **Resilience / Performance:** Execution time thresholds and asynchronous behaviors.
5. **Concurrency & Race Conditions:** Parallel execution stress (`ThreadPoolExecutor`, `Promise.all`, `Future.wait`) asserting atomic state integrity and zero TOCTOU corruption.
6. **Security Boundaries:** Rejection assertions for IDOR (403), missing CSRF tokens (403), PII masking verification via log capture fixtures, and safe error payloads without tracebacks.

## ⛔ Strict Mocking Rules
* **Zero Real I/O:** Never access physical databases, production filesystems, or live network endpoints. Use `unittest.mock`, `pytest-mock`, or in-memory fakes.
* **Mocks on Boundaries:** Inject mock repositories and adapters directly into use case and service constructors.

## 📋 Available Resources
* **AAA & Mock Patterns Guide:** [`references/aaa_mock_patterns.md`](./references/aaa_mock_patterns.md)
