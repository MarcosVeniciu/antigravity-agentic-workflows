---
name: "review-arquitetura"
description: "Architectural integrity and coupling review skill. Verifies layer isolation, Dependency Inversion, God Class decomposition, and DTO adherence on git diff."
---

# Skill: Review de Arquitetura & Acoplamento (`skills/review-arquitetura`)

Audita cirurgicamente as alterações de código da branch sob a ótica de arquitetura de software, isolamento de camadas e inversão de dependência.

## 🎯 Eixos de Análise (Diff-Based)
* **Vazamento de Infraestrutura:** Importações de frameworks ou bibliotecas de banco/rede dentro de entidades ou casos de uso.
* **Inversão de Dependências:** Instanciação direta de clientes ou repositórios em métodos; obriga injeção via construtor.
* **Classes Gigantes / Múltiplas Responsabilidades:** Decomposição em serviços especializados.
* **Mutação Indesejada de Entradas:** Criação de cópias defensivas em coleções recebidas.

## 📋 Available Resources
* **Checklist:** `references/checklist_arquitetura.md` from the `@review-arquitetura` skill.
* **Template do Artefato:** `resources/template_arquitetura.md` from the `@review-arquitetura` skill.
