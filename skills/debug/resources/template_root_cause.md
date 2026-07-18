# 🔍 Root Cause Analysis (RCA) - [Bug Description]

## 1. Contexto & Sintomas
* **Componente Afetado:** `[caminho/do/arquivo.ext]`
* **Ambiente / Erro:** `[Stack trace ou status HTTP]`

## 2. Análise dos 5 Whys (Causa Raiz)
1. **Por que o erro ocorreu?** `[Resposta]`
2. **Por que isso aconteceu?** `[Resposta]`
3. **Por que o estado estava assim?** `[Resposta]`
4. **Por que não havia validação?** `[Resposta]`
5. **Por que os testes unitários não pegaram?** `[Causa raiz definitiva]`

## 3. Matriz de Hipóteses
| Hipótese | Causa Provável | Impacto | Evidência |
|---|---|---|---|
| H1 (Mais Provável) | `[Descrição]` | Alto | `[Log/Stack Trace]` |
| H2 (Alternativa) | `[Descrição]` | Médio | `[Config/Env]` |

## 4. Alternativas de Solução
### Solução Recomendada (Opção A)
* **Ação:** `[Explicação da alteração]`
* **Prós:** `[Benefícios]`
* **Contras:** `[Riscos]`

### Solução Alternativa (Opção B)
* **Ação:** `[Explicação da alteração]`
* **Prós:** `[Benefícios]`
* **Contras:** `[Riscos]`

## 5. Plano de Prevenção & Testes
- [ ] Criar teste de regressão em `[caminho_teste]` reproduzindo o cenário.
- [ ] Salvar resolução no Obsidian Vault em `02-auditorias/pivots-[feature-slug].md`.
