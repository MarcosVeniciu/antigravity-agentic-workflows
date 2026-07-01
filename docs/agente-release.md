# Release Agent (`/release`)

The Release Agent acts as the **Release Manager**. It does not write system code; it orchestrates the transition of a software package to the primary version (*Main*) and ensures that versioning strictly reflects the dispatched code using Semantic Versioning.

---

## 1. The Agent's Focus

When several features and fixes are ready in a branch (like `develop` or a `hotfix/`), the `/release` agent consolidates the work, reads the repository's commit history, and generates a safe and explicit script that will guide the developer to merge and tag the release.

---

## 2. The Mechanics: Release Preparation

To protect the integrity of the `main` and `develop` branches, the agent follows strict constraints and a clear sequence of operations:

### Step 1: Pre-Flight Analysis
The agent first executes read-only operations to gather context:
1. **Latest Version Verification:** Executes `git describe --tags --abbrev=0` to accurately determine the base version.
2. **Commit Verification:** Reads the `git log` of all changes since the last tag.
3. **Environment Context:** Confirms current position via `git branch --show-current` and `git rev-parse --show-toplevel`.

### Step 2: SemVer Calculation (Semantic Versioning)
It analyzes the *Conventional Commits* prefixes:
* If it finds a `BREAKING CHANGE:` or `feat!:`, it increments the Major version (e.g.: 2.0.0).
* If it finds `feat:`, it increments Minor (1.1.0).
* If it only finds `fix:`, `perf:`, or `refactor:`, it increments Patch (1.0.1).

### Step 3: Scenario-Based Bash Script Output
The agent identifies if it's dealing with:
* **Scenario A (Standard Feature Release):** Merging from `develop` to `main`, and then pushing.
* **Scenario B (Hotfix Release):** Merging an emergency fix into `main` and backporting it to `develop` to prevent code drift.

It outputs organized, strictly isolated bash blocks showing exactly what the user must copy and paste into the terminal. Chaining commands (`&&`) is forbidden. *(This delegates the final execution to the developer, shielding the repository against hallucinated AI merges).*

### Step 4: Documentation Handoff
Instead of writing a root `CHANGELOG.md` autonomously, the agent encourages the user to trigger the `/grafo` workflow to log the release history securely into the project's **Obsidian Vault** (Second Brain).
