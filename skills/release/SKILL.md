---
name: "release"
description: "SemVer calculation and cumulative Changelog generation skill. Analyzes merged feature commits, bumps version numbers (Major/Minor/Patch), and formats CHANGELOG.md."
---

# Skill: Release Manager & SemVer (`skills/release`)

Calcula a nova versão do sistema segundo as regras estritas do SemVer 2.0.0 e consolida o histórico de alterações no `CHANGELOG.md` e em `03-releases/changelog-v[VERSION].md` no Obsidian.

---

## 🎯 Responsabilidades Únicas

1. **Cálculo de SemVer (SemVer 2.0.0):**
   * Avalia os commits das features mescladas na release branch:
     * Contém `BREAKING CHANGE` ou quebra de contrato? $\rightarrow$ **MAJOR**
     * Contém `feat:` (novas funcionalidades compatíveis)? $\rightarrow$ **MINOR**
     * Contém apenas `fix:`, `perf:` ou `refactor:`? $\rightarrow$ **PATCH**
2. **Geração do Changelog:**
   * Agrupa as entregas em seções: Novas Funcionalidades, Correções de Bugs, Performance/Refatoração e Breaking Changes.
   * Atualiza cumulativamente o `CHANGELOG.md` na raiz do repositório.
   * Persiste uma cópia em `03-releases/changelog-v[VERSION].md` no Obsidian Vault.

## 📋 Available Resources
* **Regras SemVer:** `references/semver_rules.md` from the `@release` skill.
* **Template do Changelog:** `resources/template_changelog.md` from the `@release` skill.