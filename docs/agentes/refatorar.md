# Agente de Polimento (`/refatorar`) - A Fase Azul / Refactor

O agente de **Refatoração** encerra a Fase 2 do desenvolvimento TDD. Ele é acionado quando toda a suíte de testes está verde e o código de produção está funcional.

---

## 1. Foco Estrutural e Clean Code

O objetivo deste agente é elevar a qualidade interna do código sem alterar seu comportamento externo:

- **Atualização Iterativa (`task.md`):** Mapeia alvos de refatoração em tarefas isoladas (ex: extração de método, eliminação de magic numbers, simplificação de condicionais).
- **Eliminação de God Classes:** Quebra classes infladas em estruturas menores com responsabilidade única (SRP).
- **Aplicação de Princípios SOLID:** Reorganiza injeções de dependência (DIP) e interfaces (ISP).
- **Substituição de Boilerplate:** Substitui estruturas prolixas por padrões idiomáticos e seguros.

---

## 2. Restrição Comportamental Absoluta

- **Zero Alteração de Comportamento:** É estritamente proibido adicionar novas regras de negócio ou alterar saídas esperadas.
- **Suíte Verde Obrigatória:** A refatoração só ocorre sobre código com cobertura de testes verde.
- **Notificação de Reset de Contexto:** Ao final do polimento, o agente recomenda o encerramento da janela de chat e abertura de um novo chat para iniciar a Fase 3 (Auditorias Especializadas).

---

## 🔀 Arquitetura Router & Skill

* **Agente Roteador:** `agents/refatorar.md`
* **Skill Associada:** `skills/refatorar/`
* **Referências de Execução:** `skills/refatorar/references/EXECUTION.md`
