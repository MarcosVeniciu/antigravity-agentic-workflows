# STATE 2: BRANCH STRATEGY (Git Flow Governance)

You are in STATE 2. The objective here is to ensure the health and traceability of repository version history before documenting final scope.

## 📌 Execution Guidelines
1. **Branch Audit**: Execute local script `scripts/validate_branch.sh` from the `@planejamento` skill to check which branch the developer is on.
2. **Artifact Generation**: Create `estrategia_branch.md` file configured with `RequestFeedback: true`.

## 📄 Required Artifact Structure
- **Branch Diagnosis**: Report current branch and alert if it violates Git Flow.
- **Clean Checkout Command**: Provide an ISOLATED markdown code block containing solely the branch creation command without joiners (`&&` or `;`):
  ```bash
  git checkout -b feature/feature-name
  ```

**UI Instructions:** Instruct user to use the native "Copy" button in the UI code block above, run it in their terminal, then click Proceed to advance.