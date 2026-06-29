# Auto-Approve Commands

This document lists the terminal commands that the Antigravity agent is expected to execute autonomously across its various workflows. 
To ensure a fluid experience without constant manual confirmations, it is highly recommended that the user adds these commands to the agent's allowed (auto-approve) list.

## Git Commands

### Context & Repository Structure
- `git rev-parse --show-toplevel`
  - **Purpose:** Used to extract the repository's root directory name (e.g., during the scope definition in the planning phase).

### Branch Strategy & History
- `git --no-pager log -n 8 --oneline --decorate`
  - **Purpose:** Used to understand the current branch and recent commit history to determine whether a new feature/fix branch should be created or if the work belongs to the current branch.

*(Note: As new workflows are added or expanded, update this list with the necessary commands that require autonomous execution).*
