# 📋 Guia e Modelo para `.env.example`

Este modelo define as diretrizes e a estrutura padrão para a criação e atualização do arquivo `.env.example`.

---

## ⚠️ Regras Obrigatórias

1. **NUNCA Inclua Segredos Reais**:
   * Utilize apenas valores genéricos, placeholders descritivos ou URLs de desenvolvimento local.
   * *Exemplo correto:* `DATABASE_URL=postgresql://user:password@localhost:5432/dbname`
   * *Exemplo incorreto:* `DATABASE_URL=postgresql://admin:SecretPass123!@192.168.1.50:5432/production`

2. **Organização por Seções**:
   * Agrupe as variáveis por contexto (Aplicação, Banco de Dados, Autenticação, APIs Externas) utilizando comentários claros (`#`).

3. **Documentação Inline**:
   * Para variáveis opcionais ou com valores numéricos/flags, insira um comentário na linha acima explicando o formato esperado e o valor padrão (default).

---

## 📑 Modelo Padrão (Template)

```env
# ==========================================
# Configurações Gerais da Aplicação
# ==========================================
# Ambiente de execução: development | staging | production
NODE_ENV=development
# Porta em que o serviço principal será executado
PORT=3000
# URL base do serviço para chamadas internas e redirects
APP_URL=http://localhost:3000

# ==========================================
# Banco de Dados & Cache
# ==========================================
# String de conexão do banco de dados (PostgreSQL/MySQL)
DATABASE_URL=postgresql://postgres:postgres@localhost:5432/app_db
# Instância do Redis para sessão/cache
REDIS_HOST=127.0.0.1
REDIS_PORT=6379

# ==========================================
# Autenticação & Segurança
# ==========================================
# Chave secreta para assinatura de tokens JWT (mínimo 32 caracteres em prod)
JWT_SECRET=your-super-secret-jwt-key-here
# Tempo de expiração do token (ex: 1d, 7d, 1h)
JWT_EXPIRES_IN=1d

# ==========================================
# Integrações & Serviços Externos
# ==========================================
# Chave de API da OpenAI (obtida no portal da OpenAI)
OPENAI_API_KEY=sk-proj-placeholder_key_here
# URL do serviço de mensageria / Webhook
WEBHOOK_URL=[https://api.exemplo.com/v1/webhook](https://api.exemplo.com/v1/webhook)