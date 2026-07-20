#!/usr/bin/env bash

# ==============================================================================
# Script de Validação Sintática e de Segurança para Arquivos .env / .env.example
# ==============================================================================
# Uso: bash .agents/skills/infra/scripts/validate_env.sh [caminho_do_arquivo]
# Exemplo: bash .agents/skills/infra/scripts/validate_env.sh .env.example
# ==============================================================================

set -euo pipefail

ENV_FILE="${1:-.env.example}"
ERRORS=0
WARNINGS=0

echo "🔍 Iniciando validação do arquivo: ${ENV_FILE}..."

# 1. Verificar existência do arquivo
if [[ ! -f "$ENV_FILE" ]]; then
    echo "❌ [ERRO] O arquivo '${ENV_FILE}' não foi encontrado!"
    exit 1
fi

LINE_NUM=0
while IFS= read -r line || [[ -n "$line" ]]; do
    ((LINE_NUM++)) || true

    # Remover espaços em branco no início e fim
    CLEAN_LINE=$(echo "$line" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

    # Ignorar linhas em branco e comentários
    [[ -z "$CLEAN_LINE" ]] && continue
    [[ "$CLEAN_LINE" =~ ^# ]] && continue

    # 2. Verificar sintaxe básica KEY=VALUE
    if [[ ! "$CLEAN_LINE" =~ ^[A-Za-z_][A-Za-z0-9_]*= ]]; then
        echo "❌ [SINTAXE - Linha ${LINE_NUM}] Formato inválido: '$CLEAN_LINE'"
        ERRORS=$((ERRORS + 1))
        continue
    fi

    # Extrair chave e valor (removendo aspas externas do valor se existirem)
    KEY=$(echo "$CLEAN_LINE" | cut -d'=' -f1)
    VAL=$(echo "$CLEAN_LINE" | cut -d'=' -f2- | sed -e 's/^"//' -e 's/"$//' -e "s/^'//" -e "s/'$//")

    # 3. Detectar possíveis credenciais reais expostas (Heurística de Segurança)
    # AWS Access Key
    if [[ "$VAL" =~ AKIA[0-9A-Z]{16} ]]; then
        echo "🚨 [SEGURANÇA - Linha ${LINE_NUM}] Possível AWS Access Key exposta em '${KEY}'!"
        ERRORS=$((ERRORS + 1))
    fi

    # Tokens / JWTs reais
    if [[ "$VAL" =~ eyJ[A-Za-z0-9_-]{10,}\.eyJ[A-Za-z0-9_-]{10,} ]]; then
        echo "🚨 [SEGURANÇA - Linha ${LINE_NUM}] Possível JWT real detectado em '${KEY}'!"
        ERRORS=$((ERRORS + 1))
    fi

    # OpenAI API Keys
    if [[ "$VAL" =~ sk-[a-zA-Z0-9]{32,} ]]; then
        echo "🚨 [SEGURANÇA - Linha ${LINE_NUM}] Possível chave de API da OpenAI exposta em '${KEY}'!"
        ERRORS=$((ERRORS + 1))
    fi

    # Private Keys (RSA/SSH)
    if [[ "$VAL" =~ BEGIN.*PRIVATE.*KEY ]]; then
        echo "🚨 [SEGURANÇA - Linha ${LINE_NUM}] Chave privada detectada em '${KEY}'!"
        ERRORS=$((ERRORS + 1))
    fi

    # 4. Verificar se valores estão vazios em .env.example (alerta leve)
    if [[ "$ENV_FILE" == *".example"* ]] && [[ -z "$VAL" ]]; then
        echo "⚠️ [AVISO - Linha ${LINE_NUM}] Variável '${KEY}' está vazia. Considere adicionar um placeholder descritivo."
        WARNINGS=$((WARNINGS + 1))
    fi

done < "$ENV_FILE"

echo "----------------------------------------"
if [[ $ERRORS -gt 0 ]]; then
    echo "❌ Validação CONCLUÍDA COM ERROS! Total de erros: ${ERRORS}, Avisos: ${WARNINGS}"
    exit 1
elif [[ $WARNINGS -gt 0 ]]; then
    echo "⚠️ Validação CONCLUÍDA COM SUCESSO (com avisos). Total de avisos: ${WARNINGS}"
    exit 0
else
    echo "✅ Validação CONCLUÍDA COM SUCESSO! Nenhum problema detectado."
    exit 0
fi