# Diretrizes de Execução SDD & Desenho Arquitetural

Este documento detalha o protocolo de execução da abordagem **Software Design Description (SDD)** aplicada durante a Fase 2 (`/artefatos`).

---

## 1. Abordagem SDD (Software Design Description)

A abordagem SDD traduz os requisitos de comportamento (BDD) definidos na Fase 1 em especificações de arquitetura e contratos antes que qualquer código de aplicação seja escrito.

---

## 2. Componentes Obrigatórios do Plano de Implementação

Ao gerar o artefato `implementation_plan.md`, a instrução deve obrigatoriamente contemplar:

### 2.1. Plano Sequencial Atomicamente Estruturado
Cada etapa deve ser numerada e especificar:
* **O Quê**: Descrição clara da alteração (arquivo a criar/modificar e função a implementar).
* **Por Quê**: A regra de negócio ou justificativa arquitetural que motiva esta etapa.
* **Critério de Aceite**: A condição específica e testável que comprova a conclusão.
* **Dependências**: Quais etapas anteriores precisam estar concluídas antes de iniciar esta.

### 2.2. Diagramação UML em Mermaid.js
Apresente visualmente a arquitetura utilizando o tipo de diagrama mais adequado à complexidade:
* **Diagrama de Sequência (`sequenceDiagram`)**: Para interações entre múltiplos componentes, chamadas de API ou fluxos de dados.
* **Diagrama de Classes (`classDiagram`)**: Para novos modelos de dados, serviços, classes ou hierarquias.
* **Fluxograma (`flowchart`)**: Para lógica condicional complexa, máquinas de estados ou árvores de decisão.
* **Diagrama ER (`erDiagram`)**: Para alterações em esquema de banco de dados.

> **Importante:** Todos os rótulos de nós contendo caracteres especiais ou parênteses devem obrigatoriamente estar entre aspas duplas (`id["Rótulo (Extra)"]`) para evitar falhas de sintaxe na renderização do Mermaid.

### 2.3. Especificação de Contratos (Mocks)
Defina explicitamente os contratos de interface ou esquemas de validação (ex: Pydantic, Zod, TypeScript Interfaces, OpenAPI schemas) que atuarão como a especificação formal para o desenvolvimento.

```python
# Exemplo de Contrato Pydantic
from pydantic import BaseModel, Field

class RequisicaoExemplo(BaseModel):
    id: str = Field(..., description="ID único do recurso")
    ativo: bool = Field(True, description="Status de ativação")
```

### 2.4. Análise de Impacto Mapeada
Enumere os módulos e arquivos existentes que sofrerão mutação ou adição, classificando-os em:
* **Additive (novo código)**: Adição de novas funções/classes sem alterar comportamento existente (Risco Baixo).
* **Mutative (modificação)**: Alteração de comportamento em arquivo existente (Risco Médio/Alto — verificar testes existentes).

---

## 3. Quality Gates (Auto-Auditoria)

Antes de gerar o artefato final para o usuário, execute esta verificação interna:
- [ ] Todas as etapas do plano sequencial possuem critérios de aceite testáveis.
- [ ] Os diagramas Mermaid utilizam caminhos e nomes de componentes reais da codebase.
- [ ] Todos os rótulos do Mermaid com caracteres especiais utilizam aspas duplas.
- [ ] A análise de impacto contempla todos os arquivos que serão tocados.
- [ ] Não há nenhum trecho de código funcional de produção ou testes no plano.
