# 📐 Plano de Implementação: [Nome da Feature]

> **Data:** [AAAA-MM-DD]
> **Status:** [Em Análise / Aprovado / Em Execução / Concluído]
> **Autor:** [Nome]

---

## 🎯 Objetivo

*Descreva o problema que esta implementação resolve e o resultado esperado após a conclusão.*

---

## 📋 Plano Sequencial

| # | O Quê | Por Quê | Critério de Aceite | Dependências |
|---|---|---|---|---|
| 1 | [Descrição da mudança — arquivo/função] | [Regra de negócio ou rationale] | [Condição testável que prova que está feito] | — |
| 2 | [Próxima mudança] | [Justificativa] | [Critério] | Etapa 1 |
| 3 | ... | ... | ... | ... |

---

## 🏗️ Diagramas Arquiteturais

*Gere os diagramas estritamente em formato Mermaid.js. Antes de cada diagrama, defina o nome exato da nota que será criada no Obsidian futuramente para arquivar este design. Substitua o placeholder pela data de hoje e um slug curto em inglês.*

> **Futura Nota no Obsidian:** `[[YYYY-MM-DD-slug-da-feature-arquitetura]]`
### Diagrama de Sequência

```mermaid
sequenceDiagram
    participant Client
    participant API
    participant Service
    participant Database
    
    Client->>API: [Requisição]
    API->>Service: [Processamento]
    Service->>Database: [Persistência]
    Database-->>Service: [Resultado]
    Service-->>API: [Resposta formatada]
    API-->>Client: [Response]
```

### Diagrama de Classes (se aplicável)

```mermaid
classDiagram
    class NomeDaClasse {
        +tipo atributo
        +tipo metodo(args)
    }
```

---

## 💥 Análise de Impacto

| Arquivo / Módulo | Tipo de Mudança | Risco |
|---|---|---|
| `path/to/file.py` | Aditiva (novo código) | Baixo — sem efeitos colaterais |
| `path/to/existing.py` | Mutativa (modificação) | Médio — pode afetar testes existentes |

---

## ✅ Checklist de Qualidade (Pré-Aprovação)

- [ ] Cada etapa possui critério de aceite testável
- [ ] Diagramas referenciam componentes reais do codebase
- [ ] Análise de impacto cobre todos os arquivos afetados
- [ ] Nenhum código de produção foi incluído neste plano

---

## Related Context

*Links para notas do vault que informaram este plano:*
- [[nota-relevante]]
