---
project: "[Project Name]"
branch: "[Branch Name]"
date: "[YYYY-MM-DD]"
author: "[Name]"
type: "review-arquitetura"
tags:
  - "review"
  - "arquitetura"
---
# 🏗️ Architecture and Coupling Review Checklist

> **Purpose:** Ensure strict layer isolation, preservation of domain boundaries, structured communication, and adherence to SOLID principles.

## How to Audit
Observe the dependency declarations of core functions, the import headers of files in the domain layers (Entities, Use Cases), and how data mutations are handled.

---

## 1. Domain Leakage (Infrastructure Isolation)
**How to Measure:** Scan the import statements at the top of files that contain core business rules (Calculations, Insights, Entities).
- [ ] **Framework Contamination:** Do files that should contain purely business rules import web route decorators (e.g., `@app.get`), HTTP packages (e.g., `requests`, `flask`), Database framework models (e.g., `SQLAlchemy`, `Django ORM`), or Cloud SDKs (e.g., `boto3`)?
- **Resolution (to be filled by Phase 2):** 

## 2. Dependency Inversion (DIP)
**How to Measure:** Check class constructors (`__init__`) and function bodies for hardcoded instantiations.
- [ ] **Hidden Dependencies:** Do functions and classes instantiate their own external clients hardcoded within their bodies (e.g., `db_client = DatabaseConnection()` or `logger = CloudLogger()`)?
- **Resolution (to be filled by Phase 2):** 

## 3. Data Transfer Contracts (DTOs)
**How to Measure:** Review the method signatures that connect distinct architectural layers (e.g., Controller calling a Service).
- [ ] **Dictionary Abuse:** Do distinct application components communicate by passing raw `dict`s or `**kwargs`, masking the expected data structure and bypassing type safety?
- **Resolution (to be filled by Phase 2):** 

## 4. Side Effects and Immutability
**How to Measure:** Analyze how functions interact with their input arguments (lists, dicts, objects). AIs often mutate inputs directly to save lines of code.
- [ ] **Input Mutation:** Does a business function modify its input arguments directly (e.g., `input_list.append(x)` or `user_dict['status'] = 'active'`) instead of returning a new modified copy?
- **Resolution (to be filled by Phase 2):** 

## 5. Interface Segregation & God Classes (ISP)
**How to Measure:** Look at class sizes, responsibilities, and inherited methods.
- [ ] **God Classes:** Does a single class handle more than two distinct architectural responsibilities (e.g., parsing data, formatting strings, AND saving to the database)?
- [ ] **Fat Interfaces:** Are clients forced to implement methods they don't use just to satisfy a generic interface?
- **Resolution (to be filled by Phase 2):** 

---

## Severity Guide

| Emoji | Severity | Action Required |
|---|---|---|
| 🔴 | Critical | Domain heavily coupled with infrastructure, making it untestable. Must fix. |
| 🟡 | Major | Dictionary abuse between layers, hidden dependencies. Should fix. |
| 🔵 | Minor | Minor side effects on local variables. Can fix in a follow-up. |
