# Guide and Template for `.env.example`

This template defines guidelines and standard structure for creating and updating `.env.example` files.

---

## Mandatory Rules

1. **NEVER Include Real Secrets**:
   * Use only generic values, descriptive placeholders, or local development URLs.
   * *Correct example:* `DATABASE_URL=postgresql://user:password@localhost:5432/dbname`
   * *Incorrect example:* `DATABASE_URL=postgresql://admin:SecretPass123!@192.168.1.50:5432/production`

2. **Organization by Section**:
   * Group variables by context (Application, Database, Authentication, External APIs) using clear comments (`#`).

3. **Inline Documentation**:
   * For optional variables or those with numeric/flag values, insert a comment on the line above explaining expected format and default value.

---

## Standard Template

```env
# ==========================================
# General Application Settings
# ==========================================
# Execution environment: development | staging | production
NODE_ENV=development
# Port on which the main service will run
PORT=3000
# Base service URL for internal calls and redirects
APP_URL=http://localhost:3000

# ==========================================
# Database & Cache
# ==========================================
# Database connection string (PostgreSQL/MySQL)
DATABASE_URL=postgresql://postgres:postgres@localhost:5432/app_db
# Redis instance for session/cache
REDIS_HOST=127.0.0.1
REDIS_PORT=6379

# ==========================================
# Authentication & Security
# ==========================================
# Secret key for JWT token signing (minimum 32 chars in prod)
JWT_SECRET=your-super-secret-jwt-key-here
# Token expiration time (e.g., 1d, 7d, 1h)
JWT_EXPIRES_IN=1d

# ==========================================
# Integrations & External Services
# ==========================================
# OpenAI API key (obtained from OpenAI portal)
OPENAI_API_KEY=sk-proj-placeholder_key_here
# Messaging service URL / Webhook
WEBHOOK_URL=https://api.example.com/v1/webhook
```