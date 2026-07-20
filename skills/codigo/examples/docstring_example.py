"""Exemplo de referência técnica de código de produção para a Fase Green do TDD.

Este arquivo serve como exemplo Few-Shot para imitação de padrão pela IA.
"""

from typing import Dict, Any


def calcular_score_risco(dados_usuario: Dict[str, Any], limite: float = 0.75) -> float:
    """Calcula a pontuação de risco para os dados do perfil do usuário.

    Args:
        dados_usuario: Dicionário contendo atributos e metadados do perfil.
        limite: Score decimal mínimo (0.0 a 1.0) para classificação de risco.

    Returns:
        float: Valor normalizado entre 0.0 e 1.0 representando o nível de risco.

    Raises:
        ValueError: Se faltarem chaves obrigatórias de identificação no payload.

    SOLID Principles:
        - Single Responsibility Principle (SRP): Concentra-se exclusivamente no 
          cálculo matemático da pontuação de risco sem realizar operações de E/S.

    Domain Context:
        Regra BR-042: Algoritmo de ponderação para análise de perfil financeiro.
        Ref: Obsidian note [[01-concepcao/sdd-[feature-slug].md]]
        Search Tag: #type/sdd #feature/[feature-slug]
    """
    if "id_usuario" not in dados_usuario:
        raise ValueError("O payload do usuário deve conter a chave 'id_usuario'.")

    # Implementação estritamente mínima para satisfazer os testes unitários (Green Phase)
    fator_base = float(dados_usuario.get("pontuacao_base", 0.0))
    score_calculado = min(1.0, fator_base * limite)

    return score_calculado