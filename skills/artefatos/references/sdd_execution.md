# SDD Execution Guidelines & Architectural Design

Este documento detalha o protocolo de construção do **Software Design Description (SDD)** na Fase 2 (`/artefatos`).

---

## 1. Escolha de Diagramas UML (Mermaid.js)

Selecione o modelo visual mais adequado para a complexidade da funcionalidade:
* **Sequence Diagram (`sequenceDiagram`)**: Recomendado para fluxos com múltiplos serviços, APIs REST, mensagens em fila e transações de banco.
* **Class Diagram (`classDiagram`)**: Recomendado para novas entidades de domínio, hierarquias de classes ou padrões como Factory/Strategy.
* **Flowchart (`flowchart`)**: Para máquinas de estado ou fluxos de decisão condicionais complexos.
* **ER Diagram (`erDiagram`)**: Para alterações e novas tabelas em esquemas de banco de dados.

> **Regra de Sintaxe Mermaid**: Rótulos com caracteres especiais, parênteses ou espaços devem ser delimitados por aspas duplas (ex: `node["Serviço de Autenticação (JWT)"]`).

---

## 2. Padrões para Contratos & Mocks

Os contratos devem atuar como especificação estrita para o desenvolvimento posterior no ciclo TDD:
* Utilizar tipos nativos e annotations da linguagem do projeto (ex: Pydantic no Python, Zod no TypeScript).
* Mapear todos os campos obrigatórios, opcionais e validações de borda.
* Definir explicitamente os códigos de retorno e exceções esperadas.