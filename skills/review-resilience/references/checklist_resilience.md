# Checklist: Resilience & Fault Tolerance Review

This document guides the audit and surgical hardening of timeouts, retries, idempotency, circuit breakers, and fallback mechanisms.

---

## 🔄 Phase 1 — Audit (Locating Evidence)

### 1. Timeouts de Ponta a Ponta (End-to-End)
* **Ausência de Timeout Explícito:** Chamadas de rede (HTTP, gRPC, banco de dados, filas) sem definição de tempo limite de conexão e leitura.
* **Configuração no Cliente vs Ponto de Chamada:** Verificar se o cliente compartilhado (ex: `httpx.Client`, `requests.Session`, `Dio()`) possui timeout configurado centralmente antes de presumir ausência no ponto de chamada.
* **Propagação de Deadlines:** Em serviços encadeados, garantir que o timeout restante seja propagado downstream para evitar processamento de requisições já canceladas pelo cliente.

### 2. Retentativas & Idempotência Obrigatória
* > [!CAUTION]
  > **Regra de Ouro da Idempotência:** Retentativas automáticas (`retries`) são **ESTRITAMENTE PROIBIDAS** em operações mutantes não-idempotentes (ex: transações financeiras, cobranças, disparos de emails, criação de registros com ID gerado no servidor) sem o envio de **Chave de Idempotência (Idempotency Key)**.
* **Classificação de Erros:** Retries devem ser acionados apenas em erros transitórios (503 Service Unavailable, 504 Gateway Timeout, timeouts de conexão). **Nunca retentar erros 4xx (400, 401, 403, 404, 422).**
* **Orçamento de Retentativas (Retry Budget) & Jitter:** Máximo de 2 a 3 tentativas, com backoff exponencial e jitter (aleatoriedade) para impedir amplificação de tráfego e *thundering herd*.

### 3. Degradação Graciosa (Fallbacks) & Integridade
* **Segurança do Fallback:** Um valor padrão ou cache só é aceitável para dados auxiliares (ex: recomendações de produtos, banners, previsão do tempo).
* **Proibição de Fallback Inseguro:** **NUNCA** usar fallback em decisões de autorização, autenticação, saldo contábil ou integridade de estoque (o sistema deve falhar de forma fechada / *fail-secure*).

### 4. Circuit Breakers & Isolamento de Falhas
* **Proteção contra Falha em Cascata:** Integrações críticas com APIs de terceiros devem implementar Circuit Breaker para interromper chamadas a serviços sabidamente fora do ar, liberando threads e conexões rapidamente.

---

## 🛠️ Phase 2 — Surgical Hardening (Mode B Only)

* **Timeouts Seguros:** Configurar connect timeout curto (ex: 1-3s) e read timeout proporcional ao SLA esperado:
  ```python
  client = httpx.Client(timeout=httpx.Timeout(connect=2.0, read=10.0, write=5.0, pool=5.0))
  ```
* **Retry Idempotente com Backoff:**
  ```python
  # Apenas para GETs ou chamadas com idempotency_key comprovada
  @retry(
      stop=stop_after_attempt(3),
      wait=wait_exponential_jitter(initial=1, max=10),
      retry=retry_if_exception_type(TransientNetworkError)
  )
  ```
* **Fail-Secure Defaults:** Tratar falhas de serviço crítico levantando exceções tipadas de domínio (`PaymentGatewayUnavailableException`) em vez de mascarar a falha com valores nulos.
