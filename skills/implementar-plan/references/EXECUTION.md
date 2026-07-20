# Guia de Análise e Clustering de Lotes Contextuais

## 1. Princípios de Agrupamento

LLMs economizam tokens e mantêm raciocínio de alta coerência quando constroem subsistemas interdependentes em uma única janela de atenção. 

### Algoritmo de Agrupamento:
1. **Identificar Entidades de Domínio:** Inspecione os diagramas de classe e sequencial do `sdd-[feature-slug].md`.
2. **Mapear Arestas de Dependência:** Se a classe $B$ recebe a classe $A$ no construtor (Injeção de Dependência), $A$ e $B$ pertencem ao **mesmo Lote Contextual**.
3. **Agrupar Mocks e Contratos:** Interfaces e DTOs necessários para o teste de uma unidade devem ser gerados junto com a própria unidade no mesmo lote.

## 2. Exemplo de Decomposição por Contexto vs. Arquivo Isolado

❌ **Antipadrão (Fragmentado por Arquivo - Alto Custo de Tokens):**
* Fase 1: Escrever teste de A
* Fase 2: Escrever código de A
* Fase 3: Escrever teste de B
* Fase 4: Escrever código de B

🟢 **Padrão Antigravity (Lote Contextual - Baixo Custo de Tokens):**
* **Lote Contextual 1: Domínio & Repositório de Sessão**
  * Testes: `tests/test_domain_session.py`, `tests/test_session_repository.py`
  * Código: `src/domain/session.py`, `src/repositories/session_repo.py`
* **Lote Contextual 2: Serviço de Autenticação & Token**
  * Testes: `tests/test_auth_service.py`
  * Código: `src/services/auth_service.py`