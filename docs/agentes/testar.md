# Agente de Depuração Reativa (`/testar`) - O Bombeiro

O agente de depuração reativa (`/testar`) atua como o mecanismo de emergência durante o loop TDD e as etapas de refatoração/revisão. Ele entra em ação apenas quando ocorrem falhas de asserção, erros de sintaxe ou erros de execução ao rodar a suíte de testes.

---

## 1. Foco em Depuração Cirúrgica

Quando a execução de testes falha, o usuário envia o log de erro do terminal acompanhado do comando `/testar`.

- **Verificação com SDD:** O agente valida o plano de implementação no Obsidian para garantir que a correção permaneça estritamente dentro dos limites da arquitetura.
- **Resolução Iterativa (`task.md`):** Classifica as causas raizes (Type Mismatch, Missing Import, Logic Error) e resolve uma falha por vez.
- **Modificação Estritamente Pontual:** Altera exclusivamente a linha ou bloco responsável pela falha, levando o status do vermelho para o verde.

---

## 2. Restrições de Atuação

- **Sem Novas Funcionalidades:** Estritamente proibido adicionar novos recursos.
- **Sem Refatoração Estética:** Não realiza limpeza de código ou abstrações adicionais.
- **Sem Alteração de Testes Válidos:** Não enfraquece asserções dos testes para forçar aprovação, a menos que o próprio teste contenha um bug objetivo de sintaxe.

---

## 3. Operação Stateless no Fluxo

O agente é stateless e serve como rede de segurança em múltiplas fases:
1. **Durante a Fase de Código:** Corrige falhas antes da refatoração.
2. **Durante a Fase de Refatoração:** Corrige quebras introduzidas pela limpeza estrutural.
3. **Durante a Fase de Auditoria (`/aplicar-review`):** Garante que ajustes de segurança ou performance não quebraram o comportamento funcional.

---

## 🔀 Arquitetura Router & Skill

* **Agente Roteador:** `agents/testar.md`
* **Skill Associada:** `skills/testar/`
* **Referências de Execução:** `skills/testar/references/EXECUTION.md`
