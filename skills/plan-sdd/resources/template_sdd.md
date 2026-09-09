---
type: sdd
feature: "{{FEATURE_SLUG}}"
project: antigravity
date: "{{DATE}}"
description: "{{DESCRIPTION}}"
tags:
  - plan_implement
  - sdd
  - phase/conception
---

# Technical Specification (SDD): {{FEATURE_NAME}}

---

## 1. Technical Goal
{{TECHNICAL_GOAL}}

---

## 2. Critical Decisions & Design Choices
> [!IMPORTANT]
> {{CRITICAL_DECISIONS_AND_DEPENDENCIES}}

---

## 3. Sequential Implementation Plan

| # | Action | Rationale | Technical Acceptance Criteria | Dependency |
|---|---|---|---|---|
| 1 | {{STEP_1_DESC}} | {{STEP_1_WHY}} | {{STEP_1_CRITERIA}} | — |
| 2 | {{STEP_2_DESC}} | {{STEP_2_WHY}} | {{STEP_2_CRITERIA}} | Step 1 |

---

## 4. Architecture & Contracts

### Technical Execution Flow (Sequence Diagram) [Mandatory]

<!--
Micro-architectural execution flow across layers for this specific vertical slice.
Trace from entry point (API/CLI) through Domain Service to Ports and Adapters/Fakes.
All message labels must be enclosed in double quotes.
-->

```mermaid
sequenceDiagram
    autonumber
    participant Client as "Client / Caller"
    participant API as "API / Controller"
    participant Service as "Business Service"
    participant Repository as "Repository / Port"
    
    Client->>API: "POST /endpoint (Payload)"
    API->>Service: "process_business_rule(dto)"
    Service->>Repository: "persist_or_query(data)"
    Repository-->>Service: "entity_result"
    Service-->>API: "response_dto"
    API-->>Client: "HTTP 200 / 201 Response"
```

### Component & Contract Structure (Class Diagram) [Mandatory]

<!--
Micro-architectural class diagram specifying typed interfaces, concrete services, DTOs, and test doubles.
Mark interfaces as <<Interface>> and test doubles as <<Fake>> or <<Mock>>.
-->

```mermaid
classDiagram
    direction TB

    class EndpointController {
        +handle_request(req: ExampleRequestDTO) ExampleResponseDTO
    }

    class BusinessService {
        -repository: IEntityRepository
        +execute(dto: ExampleRequestDTO) ExampleResponseDTO
    }

    class IEntityRepository {
        <<Interface>>
        +save(entity: Entity) Entity
        +find_by_id(id: str) Entity
    }

    class InMemoryEntityRepository {
        <<Fake>>
        -_storage: dict
        +save(entity: Entity) Entity
        +find_by_id(id: str) Entity
        +seed(data: list) void
    }

    class ExampleRequestDTO {
        +email: string
    }

    class ExampleResponseDTO {
        +id: string
        +status: string
    }

    EndpointController --> BusinessService : invokes
    BusinessService --> IEntityRepository : depends on
    InMemoryEntityRepository ..|> IEntityRepository : implements
    BusinessService ..> ExampleRequestDTO : consumes
    BusinessService ..> ExampleResponseDTO : returns
```

### Typed Contracts & Boundary Mocks [Mandatory]

```python
# Typed Contracts using Pydantic (or language equivalent)
from pydantic import BaseModel, Field, EmailStr

class ExampleRequestDTO(BaseModel):
    email: EmailStr = Field(..., description="Unique user email")

class ExampleResponseDTO(BaseModel):
    id: str = Field(..., description="Unique entity identifier")
    status: str = Field(default="active")
```

---

## 5. File Impact Analysis

| File / Module | Change Type | Risk | Notes |
| --- | --- | --- | --- |
| `path/to/new_file.py` | Additive (New) | Low | Isolated component |
| `path/to/existing_file.py` | Mutative (Edit) | Medium | Adapting behavior |

---

## Related Context & Notes
* [[bdd-{{FEATURE_SLUG}}]]
* [[dod-{{FEATURE_SLUG}}]]
