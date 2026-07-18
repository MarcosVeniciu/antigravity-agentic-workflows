# Checklist: Review Geral (Qualidade & Anti-Alucinação)

Este documento orienta a auditoria e a correção cirúrgica de qualidade geral de código, legibilidade e verificação de alucinações de IA.

---

## 🔄 Fase 1 — Auditoria (Localização de Evidências)
* Verificar alucinações de API chamando métodos inexistentes em pacotes externos.
* Inspecionar desvio de tipagem com uso de `Any`, `**kwargs`, `dict` genérico em regras de negócio.
* Detectar vestígios didáticos da LLM (comentários óbvios como `# cria lista vazia`).
* Validar se docstrings mentem sobre exceções disparadas ou assinaturas.

---

## 🛠️ Fase 2 — Aplicação Cirúrgica
* Substituir `**kwargs` por DTOs com `Pydantic` ou `dataclasses`.
* Adicionar `Type Hints` explícitos em todas as funções públicas.
* Remover comentários tautológicos mantendo apenas os que explicam regras de negócio.
* Ajustar docstrings para refletir rigorosamente o comportamento e exceções reais.
