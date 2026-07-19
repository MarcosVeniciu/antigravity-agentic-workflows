# STATE 2: BRANCH STRATEGY (Governança Git Flow)

Você está no STATE 2. O objetivo aqui é garantir a saúde e a rastreabilidade do histórico de versionamento do repositório antes de documentar o escopo final.

## 📌 Diretrizes de Execução
1. **Auditoria de Branch**: Execute o script local `scripts/validate_branch.sh` para verificar em qual branch o desenvolvedor está situado.
2. **Geração do Artefato**: Crie o arquivo `estrategia_branch.md` configurado com `RequestFeedback: true`.

## 📄 Estrutura Exigida do Artefato
- **Diagnóstico da Branch**: Informar a ramificação atual e alertar se ela viola o Git Flow.
- **Comando de Checkout Limpo**: Forneça um bloco de código markdown ISOLADO contendo unicamente o comando de criação da branch sem concatenadores (`&&` ou `;`):
  ```bash
  git checkout -b feature/nome-da-feature
  ```

**Instruções de UI:** Instrua o usuário a usar o botão "Copiar" nativo da interface no bloco de código acima, rodar em seu terminal e, em seguida, clicar em Proceed para avançar.