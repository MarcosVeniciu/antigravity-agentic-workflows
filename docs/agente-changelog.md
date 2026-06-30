# Changelog Agent (`/changelog`)

The Changelog Agent, often acting as the **Release Engineer**, does not write system code; it orchestrates the transition of a software package to the primary version (*Main*) and ensures that versioning strictly reflects the dispatched code.

---

## 1. The Agent's Focus

When several features and fixes are packaged (via `/git`), it is the `/changelog` that consolidates the work of all branches, reads the database's alteration history, and generates the final report that will guide the *merge*.

---

## 2. The Mechanics: State Machine

To protect the integrity of the `main` and `develop` branches, the agent obeys a State Machine with two distinct and immutable phases.

### State 1: The Release Candidate (`/changelog`)
In this state, the agent is forbidden from sending any destructive commands. It only performs readings and analysis:
1. **Commit Verification:** Reads the `git log` of all packages since the last *Tag*.
2. **SemVer Calculation (Semantic Versioning):** It analyzes the *Conventional Commits* prefixes. If it finds a `feat!`, it increments the Major version (e.g.: 2.0.0). If it finds `feat:`, it increments Minor (1.1.0). If it only finds `fix:` or `refactor:`, it increments Patch (1.0.1).
3. **Artifact Generation:** Creates a side file (`release_notes.md`) describing the organized Changelog for the users and displays the proposed Merge plan. 
4. **Absolute Pause:** The agent locks its execution and demands developer validation (`/release ok`).

### State 2: Finalization (`/release ok`)
Only after explicit authorization, the agent enters write execution:
1. Takes the artifact notes and updates the official `CHANGELOG.md` at the top.
2. Dumps organized bash blocks (pure Git Flow commands) showing exactly what the user must copy and paste into the terminal to cross branches to `main` and mark the `Tag` (version).
*(This delegates the final click to the developer, shielding the repository against hallucinated AI merges).*
