#!/usr/bin/env python3
"""
Script de validação de especificações arquiteturais SDD.
Garante que o artefato sdd-[slug].md cumpre os requisitos formais de seções e sintaxe Mermaid.
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

    # 1. Validação de Seções Mandatórias
    required_sections = [
        "## 🎯 1. Objetivo Técnico",
        "## 📋 3. Plano Sequencial de Implementação",
        "## 🏗️ 4. Arquitetura e Contratos",
        "## 💥 5. Análise de Impacto em Arquivos",
    ]
    for section in required_sections:
        if section not in content:
            errors.append(f"Seção obrigatória ausente: '{section}'")

    # 2. Validação de Rótulos Mermaid com aspas
    if "```mermaid" in content:
        unquoted_mermaid = re.findall(r"\w+-->>\w+:\s*[^\"\n]+", content)
        if unquoted_mermaid:
            errors.append(
                "Rótulos de mensagens em diagramas Mermaid devem estar entre aspas duplas. Exemplo com falha: "
                + unquoted_mermaid[0]
            )

    if errors:
        print("❌ Falha na validação do SDD:")
        for err in errors:
            print(f"  - {err}")
        return False

    print("✅ Sucesso: O artefato SDD está 100% em conformidade com as regras!")
    return True


if __name__ == "__main__":
    target_file = sys.argv[1] if len(sys.argv) > 1 else "implementation_plan.md"
    success = validate_sdd_file(target_file)
    sys.exit(0 if success else 1)
