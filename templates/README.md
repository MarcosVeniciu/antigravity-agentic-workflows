# Templates (`/templates`)

Este diretório contém as **Estruturas de Contrato** da Antigravity IDE. 

Para impedir que a Inteligência Artificial decida arbitrariamente como formatar relatórios ou gerar planos arquiteturais, os agentes são forçados a ler e preencher os templates contidos nesta pasta. Isso garante padronização implacável e previsibilidade na saída de dados.

---

## 📑 Lista de Templates

### 1. Planejamento & Arquitetura
* **[`template_planejamento.md`](file:///d:/Codigos/antigravity-agentic-workflows/templates/template_planejamento.md):** A estrutura de BDD (Behavior Driven Development) forçando a IA a mapear *Given, When, Then*.
* **[`template_artefatos.md`](file:///d:/Codigos/antigravity-agentic-workflows/templates/template_artefatos.md):** O SDD (Software Design Description). Força a criação do Plano de Implementação, exigindo diagramas Mermaid e contratos de interface antes da codificação começar.

### 2. Auditoria e Qualidade (QA)
Os relatórios de `/review` são altamente restritos por estes templates. Eles contêm caixas de marcação (Checklists) específicas para cada domínio e uma seção de resolução para o `/aplicar-review` preencher.
* **[`template_review_geral.md`](file:///d:/Codigos/antigravity-agentic-workflows/templates/template_review_geral.md):** Uma auditoria rápida de "Code Smell".
* **[`template_review_arquitetura.md`](file:///d:/Codigos/antigravity-agentic-workflows/templates/template_review_arquitetura.md):** Focado em SOLID, Injeção de Dependência e Design Patterns.
* **[`template_review_seguranca.md`](file:///d:/Codigos/antigravity-agentic-workflows/templates/template_review_seguranca.md):** Auditoria rigorosa baseada em OWASP (SQL Injection, Secrets, XSS).
* **[`template_review_resiliencia.md`](file:///d:/Codigos/antigravity-agentic-workflows/templates/template_review_resiliencia.md):** Avaliação de tratamento de erros, circuit breakers e falhas de rede.
* **[`template_review_performance.md`](file:///d:/Codigos/antigravity-agentic-workflows/templates/template_review_performance.md):** Análise de gargalos de memória, Queries N+1 e complexidade ciclomática.

### 3. Documentação e Grafo
* **[`template_doc_diretorio.md`](file:///d:/Codigos/antigravity-agentic-workflows/templates/template_doc_diretorio.md):** A espinha dorsal das documentações internas de pastas `src/`. Exige mapa de dependências lógicas.
* **[`template_grafo.md`](file:///d:/Codigos/antigravity-agentic-workflows/templates/template_grafo.md):** O esqueleto das notas atômicas salvas no Obsidian Vault (`01-adrs`, `03-pivots-and-bugs`, etc), assegurando o registro no metadado YAML e os links bidirecionais.

---

> 💡 **Nota de Modificação:** Se você deseja adicionar uma nova regra de auditoria de segurança ou mudar o formato do seu documento de arquitetura (SDD), basta alterar o template correspondente nesta pasta. O ecossistema inteiro se adaptará automaticamente.
