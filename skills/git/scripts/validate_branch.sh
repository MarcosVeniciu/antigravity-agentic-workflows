#!/bin/bash
# -----------------------------------------------------------------------------
# Script: validate_branch.sh
# Purpose: Validate whether active branch follows accepted Git Flow convention.
# Input Contract: No arguments (Reads local git state via CLI)
# Output Contract: 
#   - Exit 0: If branch is valid (e.g., feature/*, bugfix/*, refactor/*, release/*)
#   - Exit 1: If branch is main, master, or develop (Phase Gate Lock)
# -----------------------------------------------------------------------------

# 1. Obtain current branch name resiliently
CURRENT_BRANCH=$(git symbolic-ref --short HEAD 2>/dev/null)

# Fallback for CI/CD environments or detached HEAD
if [ -z "$CURRENT_BRANCH" ]; then
    CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
fi

# If Git repository still cannot be determined
if [ -z "$CURRENT_BRANCH" ] || [ "$CURRENT_BRANCH" == "HEAD" ]; then
    echo "❌ Error: Could not determine current branch. Make sure you are in a Git repository."
    exit 1
fi

echo "📊 Identified current branch: '$CURRENT_BRANCH'"

# 2. Explicit base branch lock (Phase Gate 1)
if [[ "$CURRENT_BRANCH" =~ ^(main|master|develop|production)$ ]]; then
    echo "⛔ [PHASE GATE LOCK]: You are on branch '$CURRENT_BRANCH'."
    echo "⚠️  Planning or implementing scopes directly on base branches is not allowed."
    echo "💡 Please create a new working branch (e.g. git checkout -b feature/my-feature)."
    exit 1
fi

# 3. Validation of accepted conventions via Regex
# Accepts patterns like: feature/name, bugfix/name, hotfix/name, refactor/name, chore/name, release/name
VALID_PATTERN="^(feature|bugfix|hotfix|refactor|chore|docs|style|test|release)/.+$"

if [[ "$CURRENT_BRANCH" =~ $VALID_PATTERN ]]; then
    echo "✅ Success: Branch '$CURRENT_BRANCH' follows project Git Flow guidelines."
    exit 0
else
    echo "❌ Error: Branch name '$CURRENT_BRANCH' is invalid."
    echo "ℹ️  Accepted patterns: feature/*, bugfix/*, hotfix/*, refactor/*, chore/*, docs/*, style/*, test/*, release/*"
    exit 1
fi
