# Exemplo de Decomposição de Épico: Gestão de Produtores e Diagnóstico Delta

Este exemplo documenta a divisão prática do épico da API Ishikawa Educampo em 4 sub-features independentes e evolutivas.

---

## 🎯 Visão do Épico
Eliminar a lentidão e o alto custo de LLM gerados por diagnósticos repetidos, substituindo o arquivo estático `farms.json` por repositórios tipados (com mock inicial), cadastro de produtor e motor de diagnóstico delta.

---

## 🏗️ Grafo de Dependências

```mermaid
flowchart TD
    F1["Sub-Feature 1: Contratos e Repositório Mock de Produtores<br/><code>feature/producer-repository-mock</code>"] --> F2["Sub-Feature 2: Rota de Cadastro de Produtor<br/><code>feature/producer-registration-endpoint</code>"]
    F1 --> F3["Sub-Feature 3: Repositório de Histórico de Execuções<br/><code>feature/execution-history-repository</code>"]
    F2 & F3 --> F4["Sub-Feature 4: Motor de Diagnóstico Delta / Incremental<br/><code>feature/incremental-delta-diagnosis</code>"]
```

---

## 📋 Fichas das Sub-Features

### 1. `feature/producer-repository-mock`
* **Objetivo:** Estabelecer a interface `IProducerRepository` e implementar `InMemoryProducerRepository` com seed carregado do `farms.json`.
* **Entregas:** Modelos `Producer` e `Farm`, contratos de busca por ID e email.
* **Impacto:** Zero rotas existentes quebradas; fundação para todas as próximas features.

### 2. `feature/producer-registration-endpoint`
* **Objetivo:** Criar o endpoint `POST /api/produtores` para registro com senha e verificação de duplicidade de e-mail.
* **Entregas:** Schema Pydantic, hashing de senha, handler da rota consumindo `IProducerRepository`.

### 3. `feature/execution-history-repository`
* **Objetivo:** Modelar contratos e persistência em mock para entradas e saídas de diagnósticos, benchmarks e simulações.
* **Entregas:** Interface `IDiagnosticHistoryRepository` e armazenamento de diagnósticos por produtor.

### 4. `feature/incremental-delta-diagnosis`
* **Objetivo:** Implementar comparador de alterações no payload e chamar a LLM apenas para os pilares Ishikawa afetados.
* **Entregas:** Algoritmo delta, orquestração cirúrgica da LLM e gravação automática no histórico.
