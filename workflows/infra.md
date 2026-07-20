---
name: "infra"
description: "Gerencia atualizações de dependências, Dockerfiles e variáveis de ambiente."
---

# Workflow: Infraestrutura & Dependências (`/infra`)

1. **Ativação do Contexto**:
   * Consulte as regras técnicas da habilidade em `@/.agents/skills/infra/SKILL.md`.

2. **Diagnóstico & Mapeamento**:
   * Identifique os manifestos presentes (`package.json`, `requirements.txt`, `Dockerfile`, `docker-compose.yml`, etc.).
   * Verifique as regras gerais em `00-core-rules/conventions.md` no Obsidian Vault.

3. **Aplicação das Alterações**:
   * Aplique edições cirúrgicas apenas nas dependências solicitadas.
   * Se houver novas variáveis de ambiente, atualize obrigatoriamente o `.env.example`.

4. **Validação & Encerramento**:
   * Valide a sintaxe dos arquivos modificados.
   * Exiba a mensagem final com a indicação para o próximo passo (`/testes`).