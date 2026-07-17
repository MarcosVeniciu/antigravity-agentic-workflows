def calcular_score_risco(dados_usuario: dict, limite: float = 0.75) -> float:
    """Calcula a pontuação de risco para os dados do usuário.

    Args:
        dados_usuario: Dicionário contendo dados do perfil.
        limite: Score mínimo para considerar alto risco.

    Returns:
        float entre 0.0 e 1.0 representando o nível de risco.

    Raises:
        ValueError: Se faltarem chaves obrigatórias em dados_usuario.

    Domain Context:
        Implementa o algoritmo de ponderação definido na regra BR-042.
        Ref: Obsidian note [[2026-07-17-regras-risco]]
    """
    # ... código mínimo ...
