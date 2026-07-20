---
name: "infra"
description: "Habilidade técnica para manipulação segura de Docker, manifests e variáveis de ambiente sem expor segredos."
---

# Skill: Infraestrutura & Dependências

## ⛔ Restrições Rígidas (Strict Constraints)
* **Sem Upgrades Cegos**: Altere apenas pacotes/bibliotecas diretamente relacionados ao objetivo.
* **Proibido Segredos Hardcoded**: Nunca inclua chaves de API, senhas, tokens de acesso ou credenciais em arquivos versionados.
* **Escopo Estrito de Infra**: Não altere código de aplicação ou lógica de negócios a menos que seja estritamente necessário para compatibilidade de build.

## 📋 Checklist de Execução & Validação
1. **Verificação de `.env.example`**:
   * Toda nova variável declarada deve possuir um placeholder explicativo em `.env.example`.
2. **Sintaxe & Integridade**:
   * Valide a estrutura sintática de arquivos JSON, YAML ou Dockerfiles antes de concluir.
3. **Próximo Passo Proposto**:
   * Ao finalizar, exiba explicitamente:
   > **[NEXT STEP]** ➡️ *"⚙️ Configurações de infraestrutura e dependências atualizadas com sucesso. Execute `/testes` para prosseguir com a Fase Red de TDD."*