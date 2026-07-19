---
name: "artefatos"
description: "Gera arquitetura SDD, diagramas UML Mermaid, contratos tipados (mocks) e análise de impacto via artefatos interativos."
---

# Skill: SDD Architecture Design & Artifact Generation

Esta skill provê as regras fundamentais de engenharia de software para transformar comportamentos esperados (BDD) em blueprint técnico (SDD) antes do desenvolvimento funcional.

---

## ⚙️ Regras Universais de SDD (Software Design Description)

1. **Think First, Code Later**: É estritamente proibido escrever ou modificar código-fonte de produção ou testes automatizados durante esta fase.
2. **Contexto Baseado em Vault**: Todas as decisões de design devem ser fundamentadas nas regras declaradas na pasta `00-core-rules/` e especificações de `01-concepcao/` encontradas no Obsidian.
3. **Mapeamento Atômico**: Cada etapa do plano deve possuir ação clara (*O quê*), justificativa (*Por quê*), condição testável (*Critério de Aceite*) e dependências explícitas.
4. **Sintaxe Segura de Mermaid**: Todos os rótulos de nós e mensagens em diagramas Mermaid contendo caracteres especiais ou parênteses devem estar obrigatoriamente entre aspas duplas (`participant C as "Componente (API)"`).
5. **Contratos Tipados**: Defina formalmente os contratos de dados através de mocks tipados (Pydantic, Zod, TypeScript Interfaces) para atuar como especificação estrita para a fase TDD.

---

## 🛠️ Recursos e Dependências da Skill

* **Manual de Execução SDD**: Consulte [references/sdd_execution.md](references/sdd_execution.md) para diretrizes avançadas sobre tipos de diagramas UML e qualidade de contratos.
* **Template de Artefato**: Utilize a estrutura em [resources/template_artefatos.md](resources/template_artefatos.md) para montar o arquivo `implementation_plan.md`.
* **Exemplo de Referência**: Siga a semântica do arquivo [examples/sdd_checkout_example.md](examples/sdd_checkout_example.md) para aprender por imitação (few-shot).
* **Script de Validação**: Execute o script [scripts/validate_sdd_contracts.py](scripts/validate_sdd_contracts.py) para auditar se o documento gerado atende a todos os critérios de qualidade do SDD.

---

## ✅ Checklist de Validação (Self-Audit)

Antes de entregar o artefato ao usuário, verifique autonomamente:
- [ ] O artefato `implementation_plan.md` contém metadata válida (`UserFacing: true`, `RequestFeedback: true`)?
- [ ] O plano sequencial descreve claramente arquivo/função, justificativa e critérios testáveis?
- [ ] Os diagramas Mermaid utilizam rótulos entre aspas e mapeiam componentes reais da codebase?
- [ ] Foram definidos contratos tipados explicitamente?
- [ ] A análise de impacto contempla todos os arquivos aditivos e mutativos afetados?
- [ ] Nenhum código-fonte funcional ou arquivo de teste foi gerado ou modificado?