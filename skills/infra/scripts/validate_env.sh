#!/usr/bin/env bash

# ==============================================================================
# Syntax and Security Validation Script for .env / .env.example Files
# ==============================================================================
# Usage: bash validate_env.sh [file_path]
# Example: bash validate_env.sh .env.example
# ==============================================================================

set -euo pipefail

ENV_FILE="${1:-.env.example}"
ERRORS=0
WARNINGS=0

echo "🔍 Starting validation for file: ${ENV_FILE}..."

# 1. Check file existence
if [[ ! -f "$ENV_FILE" ]]; then
    echo "❌ [ERROR] File '${ENV_FILE}' was not found!"
    exit 1
fi

LINE_NUM=0
while IFS= read -r line || [[ -n "$line" ]]; do
    ((LINE_NUM++)) || true

    # Strip leading and trailing whitespace
    CLEAN_LINE=$(echo "$line" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

    # Ignore blank lines and comments
    [[ -z "$CLEAN_LINE" ]] && continue
    [[ "$CLEAN_LINE" =~ ^# ]] && continue

    # 2. Check basic KEY=VALUE syntax
    if [[ ! "$CLEAN_LINE" =~ ^[A-Za-z_][A-Za-z0-9_]*= ]]; then
        echo "❌ [SYNTAX - Line ${LINE_NUM}] Invalid format: '$CLEAN_LINE'"
        ERRORS=$((ERRORS + 1))
        continue
    fi

    # Extract key and value (stripping surrounding quotes from value if present)
    KEY=$(echo "$CLEAN_LINE" | cut -d'=' -f1)
    VAL=$(echo "$CLEAN_LINE" | cut -d'=' -f2- | sed -e 's/^"//' -e 's/"$//' -e "s/^'//" -e "s/'$//")

    # 3. Detect possible real exposed credentials (Security Heuristic)
    # AWS Access Key
    if [[ "$VAL" =~ AKIA[0-9A-Z]{16} ]]; then
        echo "🚨 [SECURITY - Line ${LINE_NUM}] Possible exposed AWS Access Key in '${KEY}'!"
        ERRORS=$((ERRORS + 1))
    fi

    # Real Tokens / JWTs
    if [[ "$VAL" =~ eyJ[A-Za-z0-9_-]{10,}\.eyJ[A-Za-z0-9_-]{10,} ]]; then
        echo "🚨 [SECURITY - Line ${LINE_NUM}] Possible real JWT detected in '${KEY}'!"
        ERRORS=$((ERRORS + 1))
    fi

    # OpenAI API Keys
    if [[ "$VAL" =~ sk-[a-zA-Z0-9]{32,} ]]; then
        echo "🚨 [SECURITY - Line ${LINE_NUM}] Possible exposed OpenAI API key in '${KEY}'!"
        ERRORS=$((ERRORS + 1))
    fi

    # Private Keys (RSA/SSH)
    if [[ "$VAL" =~ BEGIN.*PRIVATE.*KEY ]]; then
        echo "🚨 [SECURITY - Line ${LINE_NUM}] Private key detected in '${KEY}'!"
        ERRORS=$((ERRORS + 1))
    fi

    # 4. Check if values are empty in .env.example (light warning)
    if [[ "$ENV_FILE" == *".example"* ]] && [[ -z "$VAL" ]]; then
        echo "⚠️ [WARNING - Line ${LINE_NUM}] Variable '${KEY}' is empty. Consider adding a descriptive placeholder."
        WARNINGS=$((WARNINGS + 1))
    fi

done < "$ENV_FILE"

echo "----------------------------------------"
if [[ $ERRORS -gt 0 ]]; then
    echo "❌ Validation COMPLETED WITH ERRORS! Total errors: ${ERRORS}, Warnings: ${WARNINGS}"
    exit 1
elif [[ $WARNINGS -gt 0 ]]; then
    echo "⚠️ Validation COMPLETED SUCCESSFULLY (with warnings). Total warnings: ${WARNINGS}"
    exit 0
else
    echo "✅ Validation COMPLETED SUCCESSFULLY! No issues detected."
    exit 0
fi