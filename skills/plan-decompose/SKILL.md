---
name: "decompor"
description: "Architectural epic decomposition and evolutionary vertical slicing skill. Breaks large complex demands into sequenced, independent sub-features with clear contracts and no cyclical rewrites."
---

# Skill: Decomposição de Épicos & Fatiamento Evolutivo (`skills/decompor`)

Decompõe iniciativas complexas e grandes mudanças de produto em uma sequência ordenada de sub-features de ciclo curto (fatias verticais), evitando Mega-PRs e saturação de contexto.

## 🎯 Regras de Ouro do Fatiamento Evolutivo

1. **Monotonicidade Arquitetural (Sem Retrabalho Destrutivo):**
   * A Sub-feature $N+1$ consome e estende o que a Sub-feature $N$ construiu.
   * É estritamente proibido fatiar de forma que a implementação da sub-feature 2 exija reescrever ou quebrar testes da sub-feature 1.
2. **Contratos e Mocks Primeiro (Boundary Isolation):**
   * Para novos bancos de dados, filas ou integrações externas, a Sub-feature 1 deve introduzir as interfaces tipadas (`IRepository`) e uma implementação mock em memória (com seed de dados de teste).
3. **Calibragem de Tamanho:**
   * Cada sub-feature deve ser autocontida e caber no ciclo de 1 chat de desenvolvimento (planejamento $\rightarrow$ TDD $\rightarrow$ refatoração $\rightarrow$ review $\rightarrow$ docs).

## 📋 Available Resources
* **Template de Épico:** `resources/template_epic.md` from the `@decompor` skill.
* **Diretrizes de Fatiamento:** `references/slicing_rules.md` from the `@decompor` skill.
* **Exemplo Prático:** `examples/epic_decomposition_example.md` from the `@decompor` skill.
