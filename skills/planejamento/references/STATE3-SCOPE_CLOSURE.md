# STATE 3: SCOPE CLOSURE (Gherkin BDD Modeling)

You are in STATE 3. The objective here is to close functional scope by transforming debate discussions into an incontestable behavioral contract.

## 📌 Execution Guidelines
1. **Metadata Collection**: Dynamically extract final branch name created in previous step and convert feature title into a valid slug.
2. **Artifact Generation**: Create `especificacao_escopo_bdd.md` file from raw model in `resources/template_planejamento.md`, configured with `RequestFeedback: true`.

## 📄 Required Artifact Structure
- **Consensual Solution**: Brief summary of winning Approach from STATE 1.
- **Pure BDD Scenarios**: Strict writing in Gherkin syntax (`Given / When / Then`), covering happy path and discussed exception paths.
- **UI Instructions**: Indicate that by clicking **Proceed**, the user approves and stamps definitive scope, authorizing permanent persistence in Obsidian vault.