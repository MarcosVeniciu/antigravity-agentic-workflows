# Checklist: Review de Arquitetura & Acoplamento

Este documento orienta a auditoria e a correção cirúrgica de isolamento de camadas, acoplamento, Inversão de Dependência e DTOs.

---

## 🔄 Fase 1 — Auditoria (Localização de Evidências)
* Verificar vazamento de infraestrutura no domínio (imports de `flask`, `SQLAlchemy`, `boto3`, `requests` em entidades/use cases).
* Checar dependências ocultas (instanciação direta de clientes de banco/API no corpo de métodos sem injeção).
* Identificar mutação de argumentos de entrada (`list.append`, `dict['key'] = val` em objetos recebidos).
* Mapear "God Classes" com múltiplas responsabilidades.

---

## 🛠️ Fase 2 — Aplicação Cirúrgica
* Extrair acessos diretos à infraestrutura para interfaces/portas (Repository Pattern / Inversão de Dependência).
* Exigir que clientes externos sejam injetados via construtor (`__init__`).
* Forçar imutabilidade criando cópias defensivas de coleções recebidas.
* Decompor God Classes em serviços especializados menores (`ParserService`, `PersistenceService`).
