# Checklist: Review de Segurança (OWASP Top 10)

Este documento orienta a auditoria e a correção cirúrgica de vulnerabilidades de segurança, injeções, sanitização e vazamento de segredos.

---

## 🔄 Fase 1 — Auditoria (Localização de Evidências)
* Buscar injeção de SQL/NoSQL via concatenação de f-strings ou strings genéricas.
* Verificar chamadas de OS (`subprocess`, `os.system`) sem listas seguras.
* Mapear endpoints sem autenticação ou com IDOR (ausência de filtro por `user_id`).
* Localizar senhas, API keys ou tokens hardcoded em variáveis ou logs.

---

## 🛠️ Fase 2 — Aplicação Cirúrgica
* Substituir concatenação por parâmetros parametrizados do ORM.
* Usar `subprocess.run(["cmd", "arg"], shell=False)` para mitigar Command Injection.
* Adicionar validação de ownership em queries (`user_id = current_user.id`).
* Mover segredos para `os.getenv()` e aplicar máscaras nos logs para PII.
