---
type: sdd
feature: checkout-pix
project: antigravity
date: "2026-07-19"
description: "Especificação de arquitetura técnica e contratos para pagamentos via PIX no checkout"
tags:
  - plan_implement
  - sdd
  - phase/concepcao
---

# 📐 Plano de Implementação (SDD): Checkout PIX

---

## 📋 Plano Sequencial de Implementação

| # | O Quê | Por Quê | Critério de Aceite | Dependências |
|---|---|---|---|---|
| 1 | Criar DTO `PixPaymentRequest` em `schemas/pix.py` | Definir contrato de entrada com validação de CPF | Validação Pydantic rejeitando CPF inválido | — |
| 2 | Criar serviço `PixGatewayService` em `services/pix.py` | Isolar integração HTTP com provedor bancário | Método `generate_qrcode` retornando Payload PIX válido | Etapa 1 |

---

## 🏗️ Arquitetura e Contratos

```mermaid
sequenceDiagram
    participant User as "Usuário / Web"
    participant API as "Checkout Controller"
    participant Service as "PixGatewayService"
    
    User->>API: "POST /checkout/pix (Payload)"
    API->>Service: "generate_qrcode(payment_dto)"
    Service-->>API: "PixQrCodeResponse"
    API-->>User: "201 Created (QR Code + Copia e Cola)"

```

```python
from pydantic import BaseModel, Field

class PixPaymentRequest(BaseModel):
    order_id: str = Field(..., description="ID do pedido")
    amount: float = Field(..., gt=0, description="Valor em Reais")
    tax_id: str = Field(..., description="CPF/CNPJ do pagador")

```

---

## 💥 Análise de Impacto

| Arquivo / Módulo | Tipo de Mudança | Risco | Observações |
| --- | --- | --- | --- |
| `app/schemas/pix.py` | Additive | Baixo | Novo esquema de validação |
| `app/services/pix.py` | Additive | Médio | Novo serviço com dependência externa |

---

## 🔗 Contexto Relacionado (Obsidian Vault)

* [[bdd-checkout-pix]]