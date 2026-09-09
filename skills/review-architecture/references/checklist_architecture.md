# Checklist: Architecture & Coupling Review

This document guides the audit of architectural boundary isolation, layer coupling, Dependency Inversion (DIP), DTO boundaries, and cohesion.

---

## Phase 0 — Automated Boundary Check (Priority Guide)

Run the boundary linter against modified files to rapidly identify known boundary violations:
```bash
python skills/review-architecture/scripts/check_arch_boundaries.py <modified_files>
```
* **Evaluation:** Treat any `[VIOLATION]` as an architectural investigation lead. Document the finding in the audit report.
* **Note:** Scanners prioritize reading but do not replace semantic architectural inspection. Always evaluate full class and module responsibilities across the diff.

---

## Phase 1 — Audit (Locating Evidence)

### 1. Isolamento de Camadas & Inversão de Dependência (DIP)
* **Vazamento de Infraestrutura no Domínio:** Verificar se camadas puras de negócio (`domain`, `entities`, `use_cases`) importam drivers de banco (`sqlalchemy`, `typeorm`, `prisma`), frameworks web (`flask`, `express`, `fastapi`) ou bibliotecas HTTP (`requests`, `axios`).
* **Dependências Ocultas:** Identificar instanciação direta de clientes de rede, serviços externos ou repositórios concretos dentro do construtor ou métodos (`new HttpClient()`, `DatabaseConnection()`).
* **Injeção de Dependência:** Verificar se serviços dependem de abstrações (interfaces/portas) passadas via construtor, facilitando testes e desacoplamento.

### 2. Fronteiras de DTOs & Contratos de Transporte
* **Exposição de Modelos Internos:** Garantir que entidades de persistência (ORM) ou modelos ricos de domínio não sejam expostos diretamente em payloads de API pública sem um DTO intermediário.
* **Contratos Estritos:** Verificar se DTOs de entrada e saída são imutáveis ou fortemente tipados (Pydantic, dataclasses, TypeScript interfaces/types).

### 3. Coesão & Princípio da Responsabilidade Única (SRP)
* **God Classes:** Mapear classes que acumulam parsing de dados, regras de negócio e chamadas de persistência no mesmo escopo.
* **Efeitos Colaterais & Mutabilidade Inesperada:** Identificar mutação de parâmetros de entrada recebidos (`args.append(...)`, modificação direta de dicionários/listas do chamador).

---

## Phase 2 — Surgical Recommendations & Mitigation (Mode B Only)

* **Inversão de Dependências:** Declarar interfaces/protocolos na camada de domínio e injetar adaptadores concretos no ponto de composição (`__init__`).
* **Fronteiras de DTO:** Introduzir mappers/DTOs específicos para desacoplar contratos de API de modelos de banco de dados.
* **Imutabilidade Consciente:** Criar cópias defensivas quando houver risco de efeito colateral compartilhado, avaliando impacto de alocação de memória em grandes coleções.
* **Decomposição Coesa:** Fatiar classes infladas em serviços especializados (`DataParser`, `ValidationService`, `PersistenceAdapter`).
