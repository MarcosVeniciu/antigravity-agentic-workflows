# STATE 3: SCOPE CLOSURE (Modelagem Gherkin BDD)

Você está no STATE 3. O objetivo aqui é fechar o escopo funcional transformando as discussões do debate em um contrato comportamental incontestável.

## 📌 Diretrizes de Execução
1. **Coleta de Metadados**: Extraia dinamicamente o nome final da branch criada no passo anterior e converta o título da feature em um slug válido.
2. **Geração do Artefato**: Crie o arquivo `especificacao_escopo_bdd.md` a partir do modelo bruto contido em `resources/template_planejamento.md`, configurado com `RequestFeedback: true`.

## 📄 Estrutura Exigida do Artefato
- **Solução Consensualizada**: Resumo breve de qual abordagem do STATE 1 foi a vencedora.
- **Cenários em BDD Puro**: Escrita estrita em sintaxe Gherkin (`Dado / Quando / Então`), cobrindo o fluxo feliz e caminhos de exceção discutidos.
- **Instruções de UI**: Indicar que ao clicar em **Proceed**, o usuário aprova e carimba o escopo definitivo, autorizando sua persistência permanente no cofre do Obsidian.