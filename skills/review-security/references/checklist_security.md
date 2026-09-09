# Checklist: Security Review (OWASP Code Review Guide v2 & ASVS Aligned)

This document guides the audit and surgical remediation of security vulnerabilities, injection flaws, input sanitization, secret leaks, SCA, LGPD logging, race conditions, and modern web attack vectors.

---

## Phase 0 — Automated Crawling (Priority Guide)

Run the automated sink scanner against modified files to rapidly identify high-risk patterns:
```bash
python skills/review-security/scripts/scan_sinks.py <modified_files>
```
* **Output Evaluation:** Prioritize inspection on lines flagged by the scanner.
* **Taint Analysis & Call Hierarchy:** Trace the data flow across caller and callee layers (1 to 2 levels up/down) to verify authentication, authorization, and whether sanitization was applied upstream.
* **Note:** The scanner catches known lexical patterns; business logic flaws (BPOA, missing state checks, logical bypasses) require manual inspection of all relevant diff changes.

---

## Phase 1 — Audit (Locating Evidence)

### 1. Gestão de Segredos & SCA
* **Credenciais Expostas:** Varrer o diff em busca de chaves privadas, senhas, tokens de API ou segredos de assinatura.
* **Ação em Caso de Vazamento:** Uma credencial comitada no repositório é considerada **comprometida**. Apenas movê-la para variável de ambiente não elimina o risco: exigir revogação, rotação imediata e expurgo do histórico de commits se aplicável.
* **SCA & Lockfiles:** Verificar se novas dependências introduzidas contêm CVEs conhecidas ou versões obsoletas.

### 2. Autenticação & Gestão de Sessão
* **Respostas de Login:** Mensagens de erro de login genéricas sem permitir enumeração de usuários válidos.
* **Proteção de Sessão:** Cookies de autenticação com flags obrigatórias: `HttpOnly`, `Secure`, `SameSite=Lax/Strict`.
* **Fixação de Sessão:** Regeneração de Session ID imediatamente após autenticação bem-sucedida e invalidação no logout.

### 3. Autorização & Controle de Acesso (BPOA / IDOR)
* **Validação de Posse (Ownership):** Garantir que requisições acessando entidades por ID (`/api/orders/{id}`) validem no servidor se o registro pertence ao usuário autenticado (`WHERE id = :id AND user_id = :current_user_id`).
* **Falta de Autorização:** Endpoints sensíveis sem anotações de verificação de permissão/roles.

### 4. Injeção (SQL, NoSQL, Comandos do SO, Path Traversal)
* **SQL/NoSQL:** Interpolação de strings em consultas vs consultas parametrizadas.
* **Comandos do SO:** Chamadas a `subprocess`, `os.system` ou `child_process` executadas com `shell=True` ou sem lista de argumentos.
* **Path Traversal:** Concatenação de parâmetros do usuário em caminhos de arquivo. Validar canonicidade via `Path.resolve().is_relative_to(base_dir)`.

### 5. Race Conditions & Concorrência (TOCTOU - OWASP Cap. 23)
* **Check-then-Act:** Verificação de saldo, estoque ou cupom seguida de mutação sem lock transacional.
* **Isolamento Concorrente:** Uso de travas no nível de linha (`SELECT ... FOR UPDATE`), operações atômicas ou versionamento otimista.

### 6. Vetores Web Modernos: CSRF, CORS & Open Redirects
* **CSRF:** Endpoints mutantes (POST/PUT/DELETE) exigem tokens anti-CSRF ou cookies com `SameSite=Strict/Lax`.
* **CORS:** Configuração que reflete dinamicamente a origem da requisição (`Access-Control-Allow-Origin: req.headers.origin`) combinada com `Access-Control-Allow-Credentials: true`.
* **Open Redirects:** Redirecionamento baseado em parâmetro de requisição (`next`, `redirect_to`). Deve ser validado via allowlist estrita de hostnames conhecidos ou restringido a caminhos relativos seguros (rejeitando `//evil.com` e esquemas como `javascript:`).

### 7. Criptografia & Entropia (CSPRNG - OWASP Cap. 12)
* **Geração de Tokens:** Tokens de autenticação, resets de senha e nãoces devem usar geradores criptográficos (`secrets` em Python, `crypto.randomUUID()` em JS/TS, `Random.secure()` em Dart).
* Proibir `random.random()` e `Math.random()` em contextos de segurança.

### 8. Proteção de Dados, Privacidade & Log Injection (LGPD)
* **Mascaramento de PII:** Nenhum dado sensível (senhas, tokens, CPF, cartões) pode ser registrado em logs.
* **Logs de Erro Internos:** Stack traces e detalhes de banco não devem ser expostos ao cliente externo; logs internos devem respeitar regras de mascaramento.
* **Log Injection (CRLF):** Sanitizar quebras de linha (`\r`, `\n`) em valores de entrada gravados em logs.

---

## Phase 2 — Surgical Application & Mitigations (Mode B Only)

* **Consultas Parametrizadas:** Substituir interpolação direta por parâmetros nomeados no ORM/driver.
* **Execução Segura:** Usar vetores de argumentos sem shell: `subprocess.run(["cmd", arg], shell=False)`.
* **Contenção de Diretório:** Usar `Path(user_path).resolve().is_relative_to(base_dir)` para anular Path Traversal.
* **Validação de Redirecionamento:**
  ```python
  from urllib.parse import urlparse
  target = urlparse(destination)
  if target.netloc and target.netloc not in ALLOWED_HOSTS:
      raise SecurityError("Untrusted redirect")
  ```
* **Controle de Acesso em Banco:** Injetar filtro de `user_id` diretamente na consulta de busca.
* **Segredos Comprometidos:** Mover para variáveis de ambiente E registrar incidente para revogação e rotação de credenciais.
