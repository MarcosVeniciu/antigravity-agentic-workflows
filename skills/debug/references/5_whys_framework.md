# Forensic Investigation & 5 Whys Framework

The **5 Whys** method is an iterative interrogation technique used to explore underlying cause-and-effect relationships behind a software issue.

## Execution Protocol
1. **Identify Observed Failure**: Begin with the visible symptom (e.g. `InternalServerError 500 on /users`).
2. **Chain Questions**: For each provided answer, ask "Why?" again until reaching systemic or structural root cause.
3. **Determine Why Test Failed to Catch**: The 5th why must mandatorily answer why the existing unit/integration test suite allowed this bug into runtime.
4. **Isolate Surgical Solution**: Fixes must address the root cause (5th why), not just the symptom (1st why).

