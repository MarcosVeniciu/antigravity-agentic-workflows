# Workflows (`/workflows`)

Este diretório é o cérebro operante da Antigravity IDE. Cada arquivo `.md` aqui dentro representa um **Agente Especialista**. 

Eles contêm as regras primárias (system prompts), o comportamento de "Máquina de Estados", os bloqueios restritivos e o "Tom de Voz" que a IA deve adotar ao assumir aquele papel específico no ciclo de desenvolvimento.

---

## 🤖 Catálogo de Agentes (Workflows)

### 1. Engenharia & Contratos
* **[`planejamento.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/planejamento.md):** (Product Manager). Realiza a técnica de Entrevista (*Grill Me*) e estrutura o escopo da feature em BDD.
* **[`artefatos.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/artefatos.md):** (Arquiteto de Software). Transforma BDD em SDD. Cria o Plano de Implementação e escreve os diagramas de sequência no formato Mermaid.js.

### 2. O Loop TDD Core
* **[`testes.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/testes.md):** (QA Test Writer). Fase Vermelha (Red). Escreve puramente as suítes de teste usando AAA (Arrange, Act, Assert) com base nos contratos.
* **[`codigo.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/codigo.md):** (Implementation Engineer). Fase Verde (Green). Escreve cirurgicamente apenas o código necessário para fazer o teste passar. Insere *docstrings* padronizadas.
* **[`testar.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/testar.md):** (Reactive Debugger). Fase de Reparo. Baseado no "Iterative Update Rule", pega a falha do pytest no terminal e corrige a implementação.
* **[`refatorar.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/refatorar.md):** (Clean Code Specialist). Fase de Polimento (Polish). Aplica SOLID e quebra *code smells* no código verde, sem alterar comportamento.

### 3. Auditoria & Fechamento
* **[`review.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/review.md):** (Auditor de Código). Fase de QA Estática. Lê o código e os `templates/` para apontar falhas de Segurança, Arquitetura, Performance e Resiliência.
* **[`aplicar-review.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/aplicar-review.md):** (Resolution Specialist). Executa de forma cadenciada a correção das falhas levantadas pelo Auditor.
* **[`docs.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/docs.md):** (Escritor Técnico). Atualiza a literatura interna das pastas, gerando `docs_preview.md` obrigatoriamente.
* **[`grafo.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/grafo.md):** (O Arquivista). Conecta as decisões de negócio e resoluções de bugs com o Obsidian Vault (Second Brain), usando "Regra da Profecia" e atomicidade.
* **[`git.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/git.md):** (Engenheiro de Release). Separa Commits Semânticos, exigindo o Corpo Narrativo (*Commit Body*) para justificar as alterações.

### 4. Tropa de Choque (Secundários)
* **[`ask.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/ask.md):** Oráculo Read-Only. Tira dúvidas da base de código forçando citação de fontes (Traceability).
* **[`changelog.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/changelog.md):** Release Manager. Calcula SemVer, orquestra merges do Git Flow e atualiza o `CHANGELOG.md` raiz.
* **[`debug.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/debug.md):** Investigador Forense. Usa os "5 Porquês" para mapear raízes de Crashes complexos ou falhas de Infraestrutura.
* **[`infra.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/infra.md):** DevOps. Edita dependências e Dockerfiles bloqueando *secrets* (gerando apenas `.env.example`).
* **[`advocate.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/advocate.md):** Developer Advocate. Edita a "Vitrine" (Root README), focando em negócio e DX (*Getting Started*).
* **[`sync.md`](file:///d:/Codigos/antigravity-agentic-workflows/workflows/sync.md):** Salva-Vidas de Contexto. Realiza um *scan* obrigatório do Vault e `GEMINI.md` para realinhar IAs após horas de conversa.

---

> 💡 **Nota de Modificação:** Alterar as instruções dentro de qualquer um destes workflows muda instantaneamente o nível de permissividade e o comportamento da IA quando a rotação for chamada (ex: `/debug`).
