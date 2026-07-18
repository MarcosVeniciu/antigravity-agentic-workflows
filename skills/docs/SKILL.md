---
name: "docs"
description: "Skill de documentação técnica do projeto (Technical Writer & Developer Advocate). Gera e atualiza a vitrine principal (README.md raiz) e a documentação interna de diretórios (README.md locais e docstrings)."
---

# Skill: Technical Writer & Developer Advocate (`skills/docs`)

Esta skill orienta a padronização e criação da documentação do repositório, alternando autonomamente entre a **Vitrine da Raiz (`README.md` principal)** e a **Documentação Técnica Local (`README.md` de módulos/subpastas)**.

---

## 📁 Recursos & Templates

* **Template de Raiz (Developer Advocate)**: [template_readme_raiz.md](resources/template_readme_raiz.md)
* **Template Local (Technical Writer)**: [template_readme_local.md](resources/template_readme_local.md)

---

## 🔄 Fluxo Operacional

### Modo 1: Vitrine Principal do Projeto (`README.md` Raiz)
Ativado quando o alvo for a raiz do repositório ou o contexto for onboarding/setup global.

1. **Pre-flight & Inspeção Global**:
   * Leia o `README.md` atual na raiz do projeto (se existir).
   * Consulte o Obsidian Vault (`09-scopes-and-features/`, `05-architecture-map/`, `07-environment-setup/`) para entender o escopo do projeto, stack e requisitos de ambiente.
   * Verifique manifestos de dependência (`package.json`, `pyproject.toml`, etc.) para extrair os comandos reais de setup.

2. **Construção da Vitrine (`README.md` Raiz)**:
   * Utilize a estrutura base em `resources/template_readme_raiz.md`.
   * Preencha todas as seções principais: Visão de Negócio, Stack Tecnológica, Arquitetura em Alto Nível (Mermaid), Getting Started (Onboarding) e Comandos Úteis.

### Modo 2: Documentação Local de Módulos (`README.md` Local)
Ativado quando o alvo for um subdiretório ou módulo específico da aplicação.

1. **Pre-flight & Análise de Módulo**:
   * Inspecione o diretório alvo e mapeie suas classes, funções, DTOs e fluxos de entrada/saída.
   * Consulte o Obsidian Vault (`05-architecture-map/`) para identificar notas associadas ao módulo.

2. **Construção da Documentação (`README.md` Local)**:
   * Utilize a estrutura base em `resources/template_readme_local.md`.
   * Preencha rigorosamente as 6 seções sem omitir nenhuma:
     1. **🎯 Visão Geral**
     2. **🏗️ Arquitetura e Fluxo de Dados** (com diagrama Mermaid)
     3. **🗂️ Mapeamento de Componentes**
     4. **🧠 Decisões de Design & Trade-offs**
     5. **🧪 Estratégia de Testes**
     6. **Related Context** (wikilinks Obsidian `[[nota]]`)

3. **Inclusão de Docstrings**:
   * Verifique se as funções e classes do módulo contêm docstrings tipadas com sintaxe `Ref: Obsidian note [[nota]]`.

---

## ⛔ Regras & Restrições

1. **Sem Comandos Obsoletos ou Falsos**: Todos os comandos documentados na seção de setup/testes devem ser validados contra as configurações reais do workspace.
2. **Sem Código de Produção**: Proibido alterar a lógica de funcionamento da aplicação (permitido apenas ajuste de docstrings).
3. **Respeito aos Templates**: Manter a estrutura dos templates correspondentes (seja o de Raiz ou as 6 seções obrigatórias do Local).

---

## ✅ Checklist de Validação

- [ ] Modo Raiz: Os comandos de instalação e inicialização foram validados contra o workspace?
- [ ] Modo Local: O `README.md` local contém todas as 6 seções obrigatórias?
- [ ] Ambas: Os diagramas Mermaid possuem sintaxe válida (rótulos entre aspas)?
- [ ] Rastreabilidade: Wikilinks Obsidian `[[nota]]` estão presentes no contexto correspondente?

