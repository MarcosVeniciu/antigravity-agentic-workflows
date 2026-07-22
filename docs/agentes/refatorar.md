# Agente de Polimento (`/refatorar`) - Refatoração de Consolidação (Fase 3)

O agente de **Refatoração** atua na **Fase 3 (Refatoração de Consolidação)** no Chat 3 (*Make it Right*). Ele é acionado **uma única vez** ao final do ciclo de desenvolvimento da feature, quando todo o código está funcional e com testes 100% verdes.

---

## 1. Foco Estrutural, Clean Code e SOLID

O objetivo deste agente é elevar a qualidade interna da funcionalidade inteira antes das auditorias:

- **Eliminação de Code Smells:** Extração de métodos longos, eliminação de magics numbers e simplificação de condicionais aninhadas.
- **Eliminação de God Classes:** Quebra de classes infladas em estruturas menores com responsabilidade única (SRP).
- **Aplicação de Princípios SOLID:** Reorganização de injeções de dependência (DIP) e interfaces (ISP).

---

## 2. Atualização do DoD e Transição de Fase

- **Zero Alteração de Comportamento:** É estritamente proibido alterar regras de negócio ou saídas de testes.
- **Suíte Verde Obrigatória:** A refatoração só ocorre sobre código com cobertura de testes verde.
- **Atualização do DoD Log:** Ao concluir a refatoração, o agente marca como concluído o item `- [x] Fase 3: Refatoração Final (/refatorar)` no arquivo `01-concepcao/dod-[feature-slug].md`.
- **Handover para Chat 4:** O agente recomenda abrir o Chat 4 para iniciar a **Fase 4 (Auditorias Especializadas)** via `/review`.

---

## 🔀 Arquitetura Router & Skill

* **Agente Roteador:** `workflows/refatorar.md`
* **Skill Associada:** `skills/refatorar/`
