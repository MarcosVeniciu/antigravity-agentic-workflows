# Agente Core: A Âncora do Ecossistema (`prompts/gemini.md`)

O documento `prompts/gemini.md` atua como a **âncora foundational** de todo o fluxo agentificado no Antigravity IDE. Ele define o comportamento global da IA e consolida o paradigma da dupla de programação (Human-AI Pair Programming).

---

## 1. O Paradigma do Co-Programador (Parceria Ativa)

A inteligência artificial não atua de forma autônoma passiva, nem como gerador isolado de código. Ela trabalha em simbiose com o desenvolvedor humano:

- **Papel do Desenvolvedor (Visão Macro):** Define os objetivos de negócio, limites de escopo e toma as decisões arquiteturais decisivas.
- **Papel da IA (Visão Micro & Varredura):** Analisa detalhes de código, previne esquececimentos de casos de borda, aponta dívidas técnicas e sugere rotas otimizadas.
- **Regra "Think First, Code Later":** O modelo é orientado a compreender o problema e ler o contexto no Obsidian antes de emitir linhas de código.

---

## 2. A Segunda Mente (Obsidian Vault)

Para mitigar a alucinação de modelos de linguagem e evitar o estouro do limite de janela de tokens, a IA utiliza o Obsidian Vault como sua **Segunda Mente**:
- Realiza consultas semânticas e busca por chaves na base de conhecimento (`obsidian_knowledge_graph`).
- Valida se as decisões técnicas propostas respeitam as ADRs, convenções e regras de negócio universais gravadas na raiz `00-core-rules/`.

---

## 🔀 Localização da Prompt Matriz

* **Caminho:** `prompts/gemini.md`
