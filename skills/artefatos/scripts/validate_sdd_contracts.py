#!/usr/bin/env python3
"""
Script de validação do artefato de arquitetura SDD.
Garante que o arquivo implementation_plan.md cumpre todos os requisitos formais.
"""

import sys
import re
from pathlib import Path


def validate_sdd_file(filepath: str) -> bool:
    path = Path(filepath)
    if not path.exists():
        print(f"❌ Erro: Arquivo {filepath} não encontrado.")
        return False

    content = path.read_text(encoding="utf-8")
    errors = []

    # 1. Validação de Seções Obrigatórias
    required_sections = [
        "## 🎯 Objetivo",
        "## 📋 Plano Sequencial de Implementação",
        "## 🏗️ Arquitetura e Contratos",
        "## 💥 Análise de Impacto",
    ]
    for section in required_sections:
        if section not in content:
            errors.append(f"Seção obrigatória ausente: '{section}'")

    # 2. Validação de rótulos em diagramas Mermaid (aspas em nós)
    if "```mermaid" in content:
        # Checa padrões sem aspas em rótulos comuns
        unquoted_mermaid = re.findall(r"\w+-->>\w+:\s*[^\"\n]+", content)
        if unquoted_mermaid:
            errors.append(
                "Rótulos no diagrama Mermaid devem usar aspas duplas. Exemplo de falha: "
                + unquoted_mermaid[0]
            )

    if errors:
        print("❌ Falha na Validação do SDD:")
        for err in errors:
            print(f"  - {err}")
        return False

    print("✅ Sucesso: O artefato SDD está em conformidade total com os padrões!")
    return True


if __name__ == "__main__":
    target_file = sys.argv[1] if len(sys.argv) > 1 else "implementation_plan.md"
    success = validate_sdd_file(target_file)
    sys.exit(0 if success else 1)