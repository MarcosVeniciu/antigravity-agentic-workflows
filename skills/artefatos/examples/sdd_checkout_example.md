---
type: sdd
feature: checkout-pix
project: antigravity
date: "2026-07-19"
description: "Technical architecture specification and contracts for PIX payments at checkout"
tags:
  - plan_implement
  - sdd
  - phase/concepcao
---

# 📐 Implementation Plan (SDD): Checkout PIX

---

## 📋 Sequential Implementation Plan

| # | What | Why | Acceptance Criterion | Dependencies |
|---|---|---|---|---|
| 1 | Create DTO `PixPaymentRequest` in `schemas/pix.py` | Define input contract with tax ID validation | Pydantic validation rejecting invalid tax ID | — |
| 2 | Create service `PixGatewayService` in `services/pix.py` | Isolate HTTP integration with banking provider | `generate_qrcode` method returning valid PIX Payload | Step 1 |

---

## 🏗️ Architecture and Contracts

```mermaid
sequenceDiagram
    participant User as "User / Web"
    participant API as "Checkout Controller"
    participant Service as "PixGatewayService"
    
    User->>API: "POST /checkout/pix (Payload)"
    API->>Service: "generate_qrcode(payment_dto)"
    Service-->>API: "PixQrCodeResponse"
    API-->>User: "201 Created (QR Code + Copy-and-Paste)"

```

```python
from pydantic import BaseModel, Field

class PixPaymentRequest(BaseModel):
    order_id: str = Field(..., description="Order ID")
    amount: float = Field(..., gt=0, description="Amount in Reais")
    tax_id: str = Field(..., description="Payer Tax ID (CPF/CNPJ)")

```

---

## 💥 Impact Analysis

| File / Module | Change Type | Risk | Notes |
| --- | --- | --- | --- |
| `app/schemas/pix.py` | Additive | Low | New validation schema |
| `app/services/pix.py` | Additive | Medium | New service with external dependency |

---

## 🔗 Related Context (Obsidian Vault)

* [[bdd-checkout-pix]]