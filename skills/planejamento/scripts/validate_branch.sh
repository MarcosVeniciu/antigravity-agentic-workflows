#!/bin/bash
# -----------------------------------------------------------------------------
# Script: validate_branch.sh
# Objetivo: Validar se a branch ativa segue a convenção Git Flow aceita.
# Contrato de Entrada: Nenhum argumento (Lê o estado do git local via CLI)
# Contrato de Saída: 
#   - Exit 0: Se a branch for válida (ex: feature/*, fix/*, refactor/*)
#   - Exit 1: Se a branch for main, master ou develop (Bloqueio de Phase Gate)
# -----------------------------------------------------------------------------

# 1. Obter o nome da branch atual de forma resiliente
CURRENT_BRANCH=$(git symbolic-ref --short HEAD 2>/dev/null)

# Fallback para ambientes de CI/CD ou HEAD destacada (detached HEAD)
if [ -z "$CURRENT_BRANCH" ]; then
    CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
fi

# Se ainda assim não encontrar o repositório Git
if [ -z "$CURRENT_BRANCH" ] || [ "$CURRENT_BRANCH" == "HEAD" ]; then
    echo "❌ Erro: Não foi possível determinar a branch atual. Certifique-se de estar em um repositório Git."
    exit 1
fi

echo "📊 Branch atual identificada: '$CURRENT_BRANCH'"

# 2. Bloqueio explícito de ramificações base (Phase Gate 1)
if [[ "$CURRENT_BRANCH" =~ ^(main|master|develop|production)$ ]]; then
    echo "⛔ [BLOQUEIO DE PHASE GATE]: Você está na branch '$CURRENT_BRANCH'."
    echo "⚠️  Não é permitido planejar ou implementar escopos diretamente nas ramificações base."
    echo "💡 Por favor, crie uma nova branch de trabalho (ex: git checkout -b feature/minha-feature)."
    exit 1
fi

# 3. Validação das convenções aceitas via Regex
# Aceita padrões como: feature/nome, bugfix/nome, hotfix/nome, refactor/nome, chore/nome
VALID_PATTERN="^(feature|bugfix|hotfix|refactor|chore|docs|style|test)/.+$"

if [[ "$CURRENT_BRANCH" =~ $VALID_PATTERN ]]; then
    echo "✅ Sucesso: A branch '$CURRENT_BRANCH' segue as diretrizes do Git Flow do projeto."
    exit 0
else
    echo "❌ Erro: O nome da branch '$CURRENT_BRANCH' é inválido."
    echo "ℹ️  Padrões aceitos: feature/*, bugfix/*, hotfix/*, refactor/*, chore/*, docs/*, style/*, test/*"
    exit 1
fi