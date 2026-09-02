---
name: "review-resiliencia"
description: "Fault tolerance and resilience review skill. Audits git diff for timeouts on I/O, circuit breakers, retry policies with backoff, and graceful degradation fallbacks."
---

# Skill: Review de Resiliência & Tolerância a Falhas (`skills/review-resiliencia`)

Audita cirurgicamente as alterações de código da branch sob a ótica de robustez operacional, falhas distribuídas e degradação graciosa.

## 🎯 Eixos de Análise (Diff-Based)
* **Timeouts Obrigatórios:** Toda chamada de rede (HTTP, gRPC, banco, fila) deve ter timeout explícito definido.
* **Políticas de Retry com Backoff:** Retentativas inteligentes com exponential backoff e jitter para evitar sobrecarga (Thundering Herd).
* **Circuit Breakers & Fallbacks:** Degradação graciosa quando serviços externos (como APIs de IA/ML ou gateways de pagamento) estiverem fora do ar.
* **Tratamento de Concorrência:** Deadlocks, concorrência otimista vs pessimista e race conditions.

## 📋 Available Resources
* **Checklist:** `references/checklist_resiliencia.md` from the `@review-resiliencia` skill.
* **Template do Artefato:** `resources/template_resiliencia.md` from the `@review-resiliencia` skill.
