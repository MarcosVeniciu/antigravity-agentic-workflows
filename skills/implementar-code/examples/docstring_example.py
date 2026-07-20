"""Exemplo de referência técnica de código de produção para a skill implementar-code."""

from typing import Dict, Any


def processar_score_credito(dados_cliente: Dict[str, Any], limite_minimo: float = 0.6) -> bool:
    """Calcula a elegibilidade de crédito do cliente baseado no perfil de risco.

    Args:
        dados_cliente: Dicionário contendo os atributos do perfil financeiro.
        limite_minimo: Limiar mínimo (0.0 a 1.0) para aprovação.

    Returns:
        bool: True se o cliente for aprovado, False caso contrário.

    Raises:
        ValueError: Se a chave obrigatória 'cpf' não estiver presente no payload.

    SOLID Principles:
        - Single Responsibility Principle (SRP): Concentra-se unicamente na regra
          de elegibilidade sem efetuar persistência ou chamadas externas.

    Domain Context:
        Regra BR-088: Elegibilidade de Crédito para Novos Perfis.
        Ref: Obsidian note [[01-concepcao/sdd-[feature-slug].md]]
        Search Tag: #type/sdd #feature/[feature-slug]
    """
    if "cpf" not in dados_cliente:
        raise ValueError("O payload do cliente deve conter a chave 'cpf'.")

    # Implementação de produção mínima
    score = dados_cliente.get("score_calculado", 0.0)
    return score >= limite_minimo