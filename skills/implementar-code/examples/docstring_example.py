"""Production code technical reference example for the implementar-code skill."""

from typing import Dict, Any


def process_credit_score(client_data: Dict[str, Any], minimum_threshold: float = 0.6) -> bool:
    """Calculates client credit eligibility based on risk profile.

    Args:
        client_data: Dictionary containing financial profile attributes.
        minimum_threshold: Minimum threshold (0.0 to 1.0) for approval.

    Returns:
        bool: True if client is approved, False otherwise.

    Raises:
        ValueError: If mandatory key 'tax_id' is not present in payload.

    SOLID Principles:
        - Single Responsibility Principle (SRP): Focuses exclusively on eligibility
          rule without performing persistence or external calls.

    Domain Context:
        Rule BR-088: Credit Eligibility for New Profiles.
        Ref: Obsidian note [[01-concepcao/sdd-[feature-slug].md]]
        Search Tag: #type/sdd #feature/[feature-slug]
    """
    if "tax_id" not in client_data:
        raise ValueError("Client payload must contain key 'tax_id'.")

    # Minimal production implementation
    score = client_data.get("calculated_score", 0.0)
    return score >= minimum_threshold