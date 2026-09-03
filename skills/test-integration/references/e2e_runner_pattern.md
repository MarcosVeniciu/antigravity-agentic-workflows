# Padrões para Testes de Integração e Runners E2E

Este guia descreve as práticas recomendadas para estruturação de suítes de testes de integração ponta a ponta.

---

## 🏗️ Estrutura de Banners em Pytest / Runners

Ao escrever testes de integração em Python (ou equivalente em Node.js/Go), utilize impressões formatadas para delimitar os estágios no terminal (`-s` flag):

```python
import pytest
import time

def log_stage(stage_num: int, title: str):
    print(f"\n{'='*70}")
    print(f"[ETAPA {stage_num}] {title}")
    print(f"{'='*70}\n")

def test_complete_integration_suite(client, test_db):
    # Etapa 1: Happy Path
    log_stage(1, "E2E HAPPY PATH: Login -> Cadastro de Produtor -> Simulação")
    # ... execuções e asserções ...
    print("  ✓ Produtor cadastrado e persistido com sucesso.")

    # Etapa 2: Unhappy Path - Falha de Auth
    log_stage(2, "UNHAPPY PATH: Acesso Sem Autenticação (403 Forbidden)")
    # ... execuções e asserções ...
    print("  ✓ Bloqueio de endpoint protegido confirmado.")

    # Etapa 3: Resiliência
    log_stage(3, "UNHAPPY PATH: Resiliência e Degradação Graciosa na API de ML")
    # ... mock de falha externa e fallback ...
    print("  ✓ Fallback acionado e resposta nominal retornada.")
```

---

## 🛡️ Critérios de Aceite de Integração
1. **Isolamento de Base de Teste**: Os testes de integração devem usar um banco de dados transacional limpo ou contêiner de teste (`testcontainers`), nunca banco de desenvolvimento ou produção.
2. **Tempo Total Limite**: A suíte de integração deve ser otimizada para rodar em menos de 60 segundos.
