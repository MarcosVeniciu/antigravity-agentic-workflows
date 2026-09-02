# 📋 Registro de Execução & Definition of Done (DoD) - Feature: `{{FEATURE_SLUG}}`

## 1. 📐 Requisitos & Arquitetura (Fase 1 - /planejamento)
> Visão geral das decisões de escopo e arquitetura.

### Artefatos de Concepção:
* 📄 [bdd-{{FEATURE_SLUG}}.md](file:///01-concepcao/bdd-{{FEATURE_SLUG}}.md)
* 📄 [sdd-{{FEATURE_SLUG}}.md](file:///01-concepcao/sdd-{{FEATURE_SLUG}}.md)

---

## 2. 💻 Linha do Tempo de Desenvolvimento (Fase 2 - /implementar)
> *Histórico dinâmico populado a cada lote de contexto do /implementar.*

* - [ ] *(Aguardando primeiras alterações do /implementar...)*

---

## 3. 🧹 Refatoração & Auditorias (Fases 3 e 4 - /refatorar e /review)
- [ ] **Fase 3: Refatoração Final (`/refatorar`)**
  - [ ] Eliminação de Code Smells e duplicações.
  - [ ] Aplicação de princípios Clean Code e SOLID sem alterar testes.
- [ ] **Fase 4: Auditorias Especializadas (`/review`)**
  - [ ] Review de Arquitetura (`skills/review-arquitetura`)
  - [ ] Review de Segurança (`skills/review-seguranca`)
  - [ ] Review de Qualidade (`skills/review-qualidade`)
  - [ ] Review de Performance (`skills/review-performance`)
  - [ ] Review de Resiliência (`skills/review-resiliencia`)

---

## 4. 📦 Documentação & Fechamento da Feature (Fase 5 - /docs)
- [ ] Documentação técnica atualizada via `/docs` (READMEs e docstrings).
- [ ] Feature integrada e validada na esteira de release via `/release`.
- [ ] Branch mesclada em `develop`.

---

## 5. ✅ Critérios de Aceite Globais (DoD)

### 5.1 Critérios Funcionais (Cenários BDD)
- [ ] **Cenário 1:** [Descrição do cenário 1 - Passando]
- [ ] **Cenário 2:** [Descrição do cenário 2 - Passando]

### 5.2 Requisitos Não-Funcionais & Qualidade (NFR)
- [ ] Tempo de resposta e desempenho dentro do limite esperado.
- [ ] 100% das suítes de testes unitários passando.
- [ ] Zero vulnerabilidades críticas ou segredos expostos no diff.
