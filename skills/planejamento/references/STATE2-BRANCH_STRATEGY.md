# STATE 2: BRANCH STRATEGY

Defina a estratégia de versionamento Git Flow para o escopo aprovado.

---

## 📌 Diretrizes
1. **Contexto Git**: Inspecione autonomamente a branch ativa e os commits recentes.
2. **Gerar Artefato**: Crie `estrategia_branch.md` (`UserFacing: true`, `RequestFeedback: true`).

## 📄 Estrutura do Artefato
- Diagnóstico da branch atual.
- Proposta da nova branch (`feature/`, `fix/`, `refactor/`).
- Bloco de código isolado contendo apenas o comando de checkout (sem `&&` ou `;`):
  ```bash
  git checkout -b feature/nome-da-feature
  ```
     - **Guia de Interação por Botões da UI**:
       > *Use o botão de **Copiar** no bloco de código acima, execute o comando no seu terminal e clique em **Proceed** para avançar para a especificação do escopo BDD.*

3. **Restrições de Formatação**:
   - Não encadeie comandos de terminal com `&&` ou `;`. O bloco deve conter o comando limpo para cópia imediata.

---

## ✅ Evidência de Sucesso
- Artefato `estrategia_branch.md` com `RequestFeedback: true`.
- Nome da branch no padrão da convenção (`feature/`, `fix/`, `refactor/`).
- Bloco de código limpo com comando único.

