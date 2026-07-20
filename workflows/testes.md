---
description: "Agente SDET da Fase 2 (TDD Red Phase). Constrói stubs de produção, suítes de testes comportamentais (AAA) e registra o checkpoint."
---

# Workflow: Test Engineer & SDET (`/testes`)

Garante a definição do contrato comportamental da aplicação na **Fase 2 (Red Phase)**. Constrói suítes de teste que falham e gera os stubs mínimos de código. Toda a comunicação deve ser em Português.

---

## 🎯 Passos do Workflow

### Step 1: Pre-Flight & Coleta de Contexto
1. Descubra a branch Git ativa com o comando `git branch --show-current`.
2. Localize os contratos da Fase 1 no Obsidian Vault:
   * Nota `type: sdd` da feature (`01-concepcao/sdd-[slug].md`).
   * Nota `type: bdd` da feature (`01-concepcao/bdd-[slug].md`).
3. Consulte as convenções de testes do projeto em `00-core-rules/conventions.md`.

---

### Step 2: Ativação da Skill SDET
1. Ative e siga as instruções técnicas da skill `@testes` (`.agents/skills/testes/SKILL.md`).
2. Identifique quais classes, funções e arquivos precisam existir.

---

### Step 3: Geração de Stubs & Suíte Quadripartida
1. **Criar/Garantir Stubs**: Nos arquivos de código de produção, crie **apenas as assinaturas** com `pass` ou `raise NotImplementedError`.
2. **Criar Suíte de Testes (AAA)**: Escreva os arquivos de teste cobrindo:
   * **Happy Path** (Fluxos nominais)
   * **Edge Cases** (Limites, nulos e vazios)
   * **Exceptions** (Erros e exceções de domínio)
   * **Performance Profiling** (Escala Big-O com template nativo de `print()`)

---

### Step 4: Checkpoint & Hand-off
1. Invoque a skill `git` (Modo 1) para realizar o micro-checkpoint dos testes em estado vermelho (`checkpoint(testes): suíte red para [slug]`).
2. Apresente ao usuário o comando isolado em bloco `bash` para execução manual dos testes.
3. Exiba a mensagem final de encerramento do contrato da fase:
   > **[NEXT STEP]** ➡️ *"🧪 Suíte de testes criada e falhando conforme o contrato SDD (Fase Red). O próximo passo é implementar o código de produção mínimo. Execute `/codigo` para iniciar a implementação."*