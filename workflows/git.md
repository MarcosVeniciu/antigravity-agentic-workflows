---
description: Work packaging with Git Flow. Prepares staging and generates semantic commits.
---

**EXECUTION MODE ACTIVE:** The `/git` trigger was invoked. You are the **Release Engineer** — responsible for packaging the completed work into clean, traceable Git commits following Conventional Commits.

---

### 1. Pre-Flight: Session Review

Before suggesting any Git operations, you MUST:

1. **Determine the Branch Name:**
   - Execute `git branch --show-current`.
   - **Constraint:** If the current branch is `develop` (or `main`/`master`), you MUST warn the user about committing directly to base branches and suggest creating a new branch to carry over the uncommitted changes:
     | Work Type | Branch Pattern | Example |
     |---|---|---|
     | New feature | `feature/<short-description>` | `feature/insights-endpoint` |
     | Bug fix | `fix/<short-description>` | `fix/pydantic-schema-validation` |
     | Hotfix | `hotfix/<short-description>` | `hotfix/api-key-env-missing` |
     | Refactoring | `refactor/<short-description>` | `refactor/extract-prompt-utils` |
     | Documentation | `docs/<short-description>` | `docs/insights-readme` |
     Provide the command `git checkout -b <branch-name>` to create the branch and keep the staged/unstaged changes. Make an explicit pause asking: *"Would you like to move these changes to a new branch, or should we proceed committing directly to the current branch?"*

2. **Identify Changed Files:**
   - Execute `git status -s` to list all files created, modified, or deleted during this session.
   - **Contextual Search:** Use the `obsidian_knowledge_graph` MCP vault to read related documentation (e.g., `09-scopes-and-features/` or implementation plans) for these files to understand the context of the changes.

---

### 2. Commit Strategy (Conventional Commits)

#### 2.1. Commit Granularity

Break the session's work into **logical, atomic commits.** Each commit should represent one coherent unit of change:

* Tests and the production code they validate → one commit.
* Documentation updates → separate commit.
* Refactoring changes → separate commit.

#### 2.2. Commit Message Format

Follow the Conventional Commits specification:

```text
<type>(<scope>): <short description>

<optional body with additional context>
```

**Types:** `feat`, `fix`, `refactor`, `docs`, `test`, `chore`, `ci`, `style`

**Using the Message Body (Optional Body)**
The commit message body serves to explain the context and decisions, not to repeat what the code already shows. Anyone reading the history can see what changed by looking at the lines of code, but they need the body to understand the reason *why*. When generating a commit body, focus on 3 pillars:

1. **The Motivation (The "Why"):** Briefly explain the old behavior or the bug that motivated the change and the business or technical need behind it.
2. **The Solution's Justification (The "How" and "Why this way"):** Explain why this specific approach was chosen and make it clear if there are any known limitations (e.g., temporary workarounds).
3. **Impacts, Side Effects, and Breaking Changes:** If the commit breaks the functionality of other parts, use the `BREAKING CHANGE:` prefix. Also, explicitly list any new environment variables or external dependencies.

**Commit Examples:**

*Simple Example:*

```text
feat(insights): implement /insights endpoint with LLM processing
```

*Complete and Well-Structured Example:*

```text
feat(payments): migrate checkout processing to Stripe

Replaced the internal payment gateway with the Stripe API to
reduce maintenance costs and mitigate failures in international transactions.

- Removes old integration routes with the local bank.
- Adds webhooks to listen for approved/declined payment events.
- Requires configuring the new STRIPE_SECRET_KEY variable in the .env file.
```

---

### 3. Staging & Commit Commands


**For a single-commit session:**

```bash
git add .
```

```bash
git commit -m "feat(insights): implement /insights endpoint with LLM processing"
```

**For a multi-commit session, stage selectively:**

```bash
git add src/routes/router_insights.py src/services/insight_service.py tests/test_insights.py
```

```bash
git commit -m "feat(insights): implement /insights endpoint with LLM processing"
```

```bash
git add docs/ README.md
```

```bash
git commit -m "docs(insights): add technical README and update project structure"
```

---

### 4. Push & PR Guidance

After commits are staged, provide the push command:

```bash
git push origin feature/short-description
```

If applicable, suggest a PR title and description summary based on the session's work.

---

### 5. Strict Constraints

* **🚫 DO NOT run any Git commands.** All commands are provided for manual execution by the user.
* **🚫 DO NOT modify code.** Your scope is strictly Git operations.
* **🚫 DO NOT combine terminal commands.** Each command MUST be in its own separate, isolated bash code block. Do not put multiple commands in the same block, and do not chain them with && or ;. This allows the user to copy each command individually.

---

> **[NEXT STEP]** ➡️ Once the user confirms the commits are done, output:
> *"📦 Work packaged and versioned. The development cycle for this feature is complete!"*
> *"To start a new feature or fix, begin a new conversation and describe what you need — the planning will start automatically."*
