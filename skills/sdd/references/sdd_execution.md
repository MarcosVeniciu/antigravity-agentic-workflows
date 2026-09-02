# Diretrizes de Execução e Modelagem SDD

Este documento estabelece as regras para construção da **Especificação Técnica de Arquitetura (SDD)** na Fase 1 (`/planejamento`).

---

## 1. Seleção do Modelo UML (Mermaid.js)

Escolha o diagrama Mermaid mais adequado para a complexidade da feature:
* **Diagrama de Sequência (`sequenceDiagram`)**: Recomendado para fluxos distribuídos, APIs REST, mensageria e transações de repositório.
* **Diagrama de Classes (`classDiagram`)**: Recomendado para modelagem de entidades de domínio, hierarquias ou padrões como Strategy/Factory.
* **Fluxograma (`flowchart`)**: Para máquinas de estados ou árvores complexas de decisão.
* **Diagrama ER (`erDiagram`)**: Para modelagem de esquemas relacionais de banco de dados.

> **Regra Obrigatória de Sintaxe Mermaid**: Todo rótulo ou mensagem que contenha espaços, parênteses ou caracteres especiais deve estar estritamente entre aspas duplas (ex: `A["Serviço de Autenticação (JWT)"]`).

---

## 2. Padrões de Contratos e Mocks

Os contratos devem servir de guia estrito para o ciclo de TDD na Fase 2:
* Utilize tipagem nativa da linguagem do projeto (ex: Pydantic no Python, Zod no TypeScript).
* Mapeie campos obrigatórios, campos opcionais com defaults e regras de validação de borda.
* Defina explicitamente códigos HTTP, exceções tipadas e respostas de erro.
