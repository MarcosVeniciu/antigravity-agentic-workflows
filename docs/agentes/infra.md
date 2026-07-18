# Agente DevOps & Infraestrutura (`/infra`)

O agente de **Infraestrutura** é acionado episodicamente quando uma nova funcionalidade requer modificações nas dependências do projeto, arquivos de ambiente ou contêineres (`Dockerfile`, `docker-compose.yml`, `requirements.txt`, `package.json`).

---

## 1. Regras de Segurança e Infraestrutura

- **Imunidade a Vazamento de Segredos:** Jamais credita senhas ou chaves reais. Atualiza apenas arquivos `.env.example` com valores de placeholder (`DB_PASS=SUA_SENHA_AQUI`).
- **Verificação de Licenças e Incompatibilidades:** Avalia o impacto e o peso de bibliotecas de terceiros solicitadas no plano de implementação antes da instalação.
- **Saída de Comandos Controlados:** Apresenta resumos de diff das mudanças de infraestrutura e fornece comandos de instalação/execução em blocos bash isolados sem encadeamento `&&`.

---

## 🔀 Arquitetura Router & Skill

* **Agente Roteador:** `agents/infra.md`
* **Skill Associada:** `skills/infra/`
* **Referências de Execução:** `skills/infra/references/EXECUTION.md`
