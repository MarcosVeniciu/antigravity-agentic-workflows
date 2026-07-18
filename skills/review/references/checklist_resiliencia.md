# Checklist: Review de Resiliência & Tolerância a Falhas

Este documento orienta a auditoria e a correção cirúrgica de timeouts de rede, idempotência, integridade de transações e estratégias de retry.

---

## 🔄 Fase 1 — Auditoria (Localização de Evidências)
* Mapear chamadas de rede sem `timeout` explícito definido.
* Mapear operações de escrita contendo múltiplos passos sem bloco transacional.
* Identificar falta de chave de idempotência em endpoints de processamento de eventos/webhooks.
* Detectar retries imediatos em loops `while True` sem backoff exponencial.

---

## 🛠️ Fase 2 — Aplicação Cirúrgica
* Injetar parâmetro de timeout rígido (ex: `timeout=5.0`) em todas as chamadas HTTP/DB.
* Envolver escritas encadeadas em `with db.transaction():` garantindo rollback.
* Adicionar checagem por Event ID/Hash antes de reprocessar webhooks.
* Utilizar bibliotecas de retry com backoff exponencial e jitter (ex: `tenacity`).
