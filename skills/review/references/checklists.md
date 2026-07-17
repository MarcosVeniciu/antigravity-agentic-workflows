# Directrizes e Checklists por Domínio de Review

Este documento compila os procedimentos e estratégias cirúrgicas para execução das duas fases da Skill de Review (`skills/review/SKILL.md`):
* **Fase 1 (Auditoria):** Como localizar evidências mecânicas.
* **Fase 2 (Aplicação Cirúrgica):** Como aplicar a correção preservando contratos e testes.

---

## 1. Review Geral (Qualidade & Anti-Alucinação)
* **Fase 1 (Auditoria):**
  * Verificar alucinações de API chamando métodos inexistentes em pacotes externos.
  * Inspecionar desvio de tipagem com uso de `Any`, `**kwargs`, `dict` genérico em regras de negócio.
  * Detectar vestígios didáticos da LLM (comentários óbvios como `# cria lista vazia`).
  * Validar se docstrings mentem sobre exceções disparadas ou assinaturas.
* **Fase 2 (Aplicação Cirúrgica):**
  * Substituir `**kwargs` por DTOs com `Pydantic` ou `dataclasses`.
  * Adicionar `Type Hints` explícitos em todas as funções públicas.
  * Remover comentários tautológicos mantendo apenas os que explicam regras de negócio.
  * Ajustar docstrings para refletir rigorosamente o comportamento e exceções reais.

---

## 2. Review de Arquitetura & Acoplamento
* **Fase 1 (Auditoria):**
  * Verificar vazamento de infraestrutura no domínio (imports de `flask`, `SQLAlchemy`, `boto3`, `requests` em entidades/use cases).
  * Checar dependências oculta (instanciação direta de clientes de banco/API no corpo de métodos sem injeção).
  * Identificar mutação de argumentos de entrada (`list.append`, `dict['key'] = val` em objetos recebidos).
  * Mapear "God Classes" com múltiplas responsabilidades.
* **Fase 2 (Aplicação Cirúrgica):**
  * Extrair acessos diretos à infraestrutura para interfaces/portas (Repository Pattern / Inversão de Dependência).
  * Exigir que clientes externos sejam injetados via construtor (`__init__`).
  * Forçar imutabilidade criando cópias defensivas de coleções recebidas.
  * Decompor God Classes em serviços especializados menores (`ParserService`, `PersistenceService`).

---

## 3. Review de Segurança (OWASP Top 10)
* **Fase 1 (Auditoria):**
  * Buscar injeção de SQL/NoSQL via concatenação de f-strings ou strings genéricas.
  * Verificar chamadas de OS (`subprocess`, `os.system`) sem listas seguras.
  * Mapear endpoints sem autenticação ou com IDOR (ausência de filtro por `user_id`).
  * Localizar senhas, API keys ou tokens hardcoded em variáveis ou logs.
* **Fase 2 (Aplicação Cirúrgica):**
  * Substituir concatenação por parâmetros parametrizados do ORM.
  * Usar `subprocess.run(["cmd", "arg"], shell=False)` para mitigar Command Injection.
  * Adicionar validação de ownership em queries (`user_id = current_user.id`).
  * Mover segredos para `os.getenv()` e aplicar máscaras nos logs para PII.

---

## 4. Review de Performance & Complexidade
* **Fase 1 (Auditoria):**
  * Calcular complexidade ciclomática V(G) = E - N + 2P (máximo permitido: 10).
  * Mapear complexidade assintótica (procurar buscas O(n^2) como `for x in list: if y in list_2`).
  * Identificar o problema N+1 em chamadas ORM dentro de loops.
  * Checar acúmulo de coleções gigantes em memória sem uso de geradores/generators.
* **Fase 2 (Aplicação Cirúrgica):**
  * Aplicar early returns (Guard Clauses) e extração de métodos para reduzir V(G) < 10.
  * Converter buscas em listas para `set` ou `dict` garantindo O(1).
  * Injetar `select_related`/`prefetch_related` ou joins no ORM para eliminar N+1.
  * Substituir materialização em memória por `yield` (Generators).

---

## 5. Review de Resiliência & Tolerância a Falhas
* **Fase 1 (Auditoria):**
  * Mapear chamadas de rede sem `timeout` explícito definido.
  * Mapear operações de escrita contendo múltiplos passos sem bloco transacional.
  * Identificar falta de chave de idempotência em endpoints de processamento de eventos/webhooks.
  * Detectar retries imediatos em loops `while True` sem backoff exponencial.
* **Fase 2 (Aplicação Cirúrgica):**
  * Injetar parâmetro de timeout rígido (ex: `timeout=5.0`) em todas as chamadas HTTP/DB.
  * Envolver escritas encadeadas em `with db.transaction():` garantindo rollback.
  * Adicionar checagem por Event ID/Hash antes de reprocessar webhooks.
  * Utilizar bibliotecas de retry com backoff exponencial e jitter (ex: `tenacity`).
