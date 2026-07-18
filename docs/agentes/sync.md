# Agente Sincronizador de Contexto (`/sync`)

O agente `/sync` executa rotinas de limpeza de ruído e alinhamento de memória para sessões longas de desenvolvimento em que a janela de tokens da IA começa a ficar sobrecarregada por logs e tracebacks.

---

## 1. Varredura Silenciosa e Realinhamento

1. **Re-leitura dos Prompts de Master Rule:** Re-âncora as diretrizes base descritas em `prompts/gemini.md`.
2. **Re-leitura de Notas do Obsidian:** Varre as notas atômicas ativas no Vault (`00-core-rules/`, `01-concepcao/`, `02-auditorias/`) para relembrar regras de negócio e ADRs.
3. **Relatório de Sincronização:** Emite um relatório sumarizado na IDE demonstrando que o contexto do modelo foi realinhado com o estado oficial do repositório.

---

## 🔀 Arquitetura Router & Skill

* **Skill Associada:** `skills/sync/`
* **Operação:** Leitura passiva e emissão de relatório de realinhamento sem execução de modificações de código.
