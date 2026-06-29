# Visão Geral da Arquitetura

O ecossistema do **Antigravity IDE** é desenhado como uma arquitetura de múltiplos agentes, onde cada agente é evocado através de gatilhos específicos (slash commands) e opera sob um contexto de responsabilidade única.

## Como os Agentes se Conectam

A arquitetura linear do sistema garante que a saída de um agente seja a entrada (contexto rígido) para o próximo. O fluxo padrão é:

1. **Planning (GEMINI):** Levanta requisitos e define o escopo.
2. **Blueprints (`/artefatos`):** Gera o plano técnico e os diagramas.
3. **Infraestrutura (`/infra`):** (Opcional) Resolve dependências e Docker.
4. **TDD - Red Phase (`/testes`):** Escreve a suíte de testes (comportamento e performance).
5. **TDD - Green Phase (`/codigo`):** Implementa o mínimo necessário para passar nos testes.
6. **Reativo (`/testar`):** (Condicional) Corrige a lógica se os testes falharem.
7. **Auditoria (`/review`):** Inspeciona o código com templates específicos.
8. **Polimento (`/refatorar`):** Aplica SOLID e clean code com base no review.
9. **Documentação (`/docs`):** Documenta a solução.
10. **Grafo de Conhecimento (`/grafo`):** Arquiva decisões e regras no Obsidian.

## Salvamento de Artefatos no Obsidian (Knowledge Graph)

Para combater a "amnésia" da IA em sessões longas (context window limits), o Antigravity utiliza o servidor MCP `obsidian_knowledge_graph` como seu "Segundo Cérebro".

O processo de persistência ocorre em duas fases principais:
- **Consultas (Leitura):** No início de cada workflow, os agentes buscam templates obrigatórios na pasta `08-templates/` e regras de negócio em `04-domain-rules/`.
- **Registro (Escrita):** No final de cada sessão, o comando `/grafo` gera notas atômicas na taxonomia correta (ex: `01-adrs/`), garantindo que o plano original de arquitetura e as soluções de bugs não se percam em conversas antigas.
