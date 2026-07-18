---
name: "release"
description: "Skill de gerenciamento de releases (Release Manager). Calcula Semantic Versioning (SemVer), gera Changelogs estruturados e orquestra a publicação de versões."
---

# Skill: Release Management & SemVer (`skills/release`)

Esta skill orienta a consolidação de alterações da branch de desenvolvimento, o cálculo do versionamento semântico (SemVer) e a geração de notas de lançamento (Changelog).

---

## 🛠️ Guia de Execução & Regras SemVer

Consulte as regras de versionamento semântico em:
* [Guia de Regras SemVer](references/semver_rules.md)

---

## 📁 Recursos & Templates

* **Template do Changelog**: [template_changelog.md](resources/template_changelog.md)

---

## 🔄 Fluxo Operacional

1. **Pre-flight & Inspeção de Commits**:
   * Analise o histórico de commits recentes na branch ativa e a versão atual registrada no projeto.
   * Consulte no Obsidian Vault em `06-roadmap-and-state/` os itens marcados como concluídos.

2. **Cálculo do SemVer**:
   * **Major (X.0.0)**: Quebra de compatibilidade/contrato.
   * **Minor (0.X.0)**: Novas funcionalidades retrocompatíveis.
   * **Patch (0.0.X)**: Correções de bug e refatorações retrocompatíveis.

3. **Geração do Changelog**:
   * Estruture as notas utilizando o template em `resources/template_changelog.md`.

4. **Comandos Git Propostos**:
   * Proponha os comandos git em bloco `bash` isolado para mesclagem de branch e criação de tag anotada.

---

## ⛔ Regras & Restrições

1. **Proibido Force Push**: Nunca proponha `git push --force`.
2. **Tags Anotadas Obrigatórias**: Releases de produção devem ser acompanhadas de tag anotada (`git tag -a vX.Y.Z`).

---

## ✅ Checklist de Validação

- [ ] O bump de versão está estritamente justificado pelo tipo de commit?
- [ ] O Changelog foi categorizado em Funcionalidades, Correções, Performance e Breaking Changes?
- [ ] Os comandos Git para tag anotada foram fornecidos em bloco `bash` isolado?
