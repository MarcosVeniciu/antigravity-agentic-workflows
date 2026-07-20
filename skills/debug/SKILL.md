---
name: "debug"
description: "Habilidade forense de investigação de bugs e análise de causa raiz (5 Whys). Diagnostica falhas em runtime e infraestrutura."
---
# Skill: Forensic Bug Investigator

Esta skill provê as regras rígidas e a metodologia de engenharia para diagnosticar falhas que escaparam dos testes unitários.

## ⛔ Restrições Estritas de Operação

* **Pausa Obrigatória (RequestFeedback):** A análise de causa raiz e as alternativas de solução devem ser apresentadas EXCLUSIVAMENTE via um artefato chamado `root_cause_analysis.md`, que deve ser configurado com `RequestFeedback: true`. A execução deve pausar para aprovação do usuário antes de qualquer código ser modificado.
* **Proibido Adivinhar:** Se faltarem informações essenciais (logs completos, arquivos `.env`, configurações), você deve pausar e solicitar explicitamente essas evidências ao usuário.
* **Blocos Bash Isolados:** Qualquer comando de diagnóstico sugerido deve ser fornecido em blocos `bash` individuais e isolados para facilitar a cópia manual pelo usuário.

## 📁 Recursos e Dependências da Skill

* **Metodologia de Diagnóstico:** Consulte o manual em `references/5_whys_framework.md` caso precise aplicar o método de interrogação iterativa para achar a causa raiz sistêmica.
* **Template do Artefato:** Use o modelo `resources/template_root_cause.md` para estruturar e instanciar o arquivo `root_cause_analysis.md` na interface da IDE.