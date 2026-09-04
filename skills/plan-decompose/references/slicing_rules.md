# Vertical Slicing Rules & Epic Decomposition

This manual details how to design an epic's sub-feature pipeline to prevent technical debt and destructive rework.

---

## 🚫 Anti-Pattern: Horizontal Slicing (Layer by Layer)
* **How NOT to do it:**
  * Feature 1: Create database tables.
  * Feature 2: Create API endpoints.
  * Feature 3: Connect API to database.
* **Why it fails:** None of the features deliver isolated functional value, and Feature 1 unit tests do not represent a real-world business use case.

---

## ✅ Recommended Pattern: Evolutionary Vertical Slicing

Each sub-feature must deliver a **complete vertical slice** (contract $\rightarrow$ logic $\rightarrow$ persistence/mock $\rightarrow$ test), adhering to the following rules:

### 1. "Boundary First" Rule (Boundary Isolation)
When the epic introduces persistence or external communication:
* **Sub-feature 1** defines the typed interface (e.g., `IProducerRepository`) and an in-memory implementation (`MockProducerRepository`).
* The mock must provide seed methods that leverage existing test data (e.g., loading legacy JSON files).
* No production routes are modified yet; the focus is creating a 100% tested architectural foundation.

### 2. Monotonic Extension Rule
* **Sub-feature 2** consumes repository methods established in Feature 1.
* If Sub-feature 2 requires a new repository method, it must **add** the method without altering existing signatures.

### 3. Risk Boundary Rule
* Keep high-risk components (such as scoring engines or LLM calls) isolated from basic CRUD/registration features.
