# Manual de Execução: Clean Code Specialist (`/refatorar`)

Este guia detalha os padrões técnicos para eliminação de Code Smells e aplicação de princípios SOLID durante a Refactor Phase.

---

## 1. Catálogo de Refatorações Recomendadas

### 1.1. Guard Clauses (Eliminação de Aninhamento Profundo)
* **Sintaxe/Problema**: Retornos aninhados dentro de múltiplos blocos `if/else`. Aumenta a complexidade ciclomática.
* **Solução**: Inverta a lógica. Valide as condições de borda/erro no início da função e retorne ou levante exceções imediatamente.

### 1.2. Extract Function / Method (SRP - Single Responsibility)
* **Sintaxe/Problema**: Métodos que realizam validação, cálculo, formatação e persistência no mesmo bloco de código.
* **Solução**: Isole sub-tarefas em funções privadas/internas com nomes declarativos (ex: `_validar_payload()`) e tipagem explícita.

### 1.3. Constantes Nomeadas (Eliminação de Magic Numbers)
* **Sintaxe/Problema**: Números, strings ou valores literais repetidos na lógica (ex: `if status == 3:` ou `taxa = val * 0.08`).
* **Solução**: Substitua por constantes explicitamente nomeadas em UPPER_CASE (ex: `STATUS_PROCESSANDO = 3`) no topo do módulo ou classe.

### 1.4. Inversão de Dependência (DIP)
* **Sintaxe/Problema**: Instanciação direta de serviços externos, repositórios ou integrações dentro do domínio de negócio.
* **Solução**: Injete dependências via construtor utilizando interfaces ou abstrações genéricas.

---

## 2. Validação Pós-Refatoração

- [ ] Funções possuem apenas um nível de abstração?
- [ ] Módulos/Classes respeitam o princípio SRP (Single Responsibility)?
- [ ] Todas as constantes mágicas foram substituídas por nomes descritivos?
- [ ] Docstrings e Type Hints foram atualizados para novas funções extraídas?
- [ ] A suíte inteira de testes rodou e continua 100% verde?