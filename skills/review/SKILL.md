---
name: "review"
description: "Executa auditorias metódicas de código e aplicação de correções cirúrgicas em duas fases: Fase 1 (Auditoria e Relatório) e Fase 2 (Aplicação Cirúrgica de Correções)."
---

# Skill: Review e Resolução de Auditoria (`skills/review`)

Esta skill orienta o assistente no fluxo sequencial de **duas fases** para auditoria e correção de código-fonte na branch ativa.

---

## 🎯 Mapeamento de Domínios & Templates

O tipo de auditoria é determinado pelo gatilho ou parâmetro fornecido pelo usuário:

| Gatilho / Subcomando | Foco | Template em `resources/templates/` |
|---|---|---|
| `/review` (Default) | Qualidade geral, legibilidade, alucinações de IA, docstrings e testes | `template_geral.md` |
| `/review arquitetura` | Isolamento de camadas, acoplamento, Inversão de Dependência, DTOs | `template_arquitetura.md` |
| `/review seguranca` | OWASP Top 10, injeção de SQL/OS, sanitização, segredos hardcoded | `template_seguranca.md` |
| `/review performance` | Complexidade ciclomática V(G) > 10, Big-O, N+1 no ORM, geradores | `template_performance.md` |
| `/review resiliencia` | Timeouts de rede, idempotência, transações no banco, retries | `template_resiliencia.md` |

---

## 🔄 Fluxo Operacional: Fase 1 — Auditoria & Relatório

### 1.1. Coleta de Contexto
1. Execute `git branch --show-current` para identificar a branch em análise.
2. Execute `git status -s` para mapear os arquivos alterados/criados na branch.
3. Consulte o Obsidian Vault (`01-concepcao/` ou `05-architecture-map/`) para verificar o plano de implementação (SDD) da funcionalidade e os contratos estipulados.

### 1.2. Execução da Auditoria
* Carregue o template correspondente de `resources/templates/`.
* Consulte `references/checklists.md` para aplicar a medição técnica e identificar falhas.
* **Proibição Rígida:** Não altere nenhum arquivo de código-fonte durante a Fase 1.

### 1.3. Emissão dos Relatórios
Gere o relatório em dois destinos:
1. **Artefato de Chat Interativo (IDE):** `audit_report_[tipo].md` (ex: `audit_report_geral.md`, `audit_report_seguranca.md`) com `UserFacing: true` e **`RequestFeedback: true`**. Isso cria um artefato dedicado para cada domínio e apresenta o botão "Proceed" para o usuário aprovar o relatório antes de avançar.
2. **Memória Permanente (Obsidian Vault):** Salve sob `10-review-reports/{projeto}_{YYYY-MM-DD}_[descrição-amigável]_[tipo].md`.

### 1.4. Transição e Aprovação do Usuário
A Fase 1 se encerra com a criação do artefato interativo `audit_report_[tipo].md` (`RequestFeedback: true`). O assistente **aguarda a confirmação/aprovação explícita do usuário** (ex: clicando em Proceed) para iniciar a **Fase 2 (Aplicação Cirúrgica de Correções)**.

---

## 🔄 Fluxo Operacional: Fase 2 — Aplicação Cirúrgica de Correções

### 2.1. Preparação da Tarefa
1. Leia o relatório do domínio atual (`audit_report_[tipo].md`) gerado na Fase 1.
2. Crie ou atualize o artefato `task.md` listando os itens pendentes `[ ]`.

### 2.2. Execução Cirúrgica Iterativa
Para cada item do relatório:
1. Marque o item como em andamento `[/]` no `task.md`.
2. Aplique a menor alteração possível de código necessária para sanar o problema (baseando-se nos guias de `references/checklists.md`).
3. **Restrição:** Não altere a lógica de negócio principal nem a suíte de testes.
4. Marque o item como concluído `[x]` no `task.md`.
5. Atualize o artefato `audit_report_[tipo].md` e a cópia em `10-review-reports/` do Obsidian Vault:
   - Marque o checkbox `[x]`.
   - Preencha o campo **Resolution (to be filled by Phase 2)** com uma descrição clara da correção efetuada.

### 2.3. Encerramento & Validação
Ao concluir todos os itens:
1. Apresente ao usuário o comando de terminal isolado para validação da suíte de testes:

```bash
pytest path/to/tests -v
```

2. Exiba a instrução da próxima etapa da esteira de qualidade:
   * Se `/review` geral concluído ➡️ Sugerir `/review arquitetura`.
   * Se `/review arquitetura` concluído ➡️ Sugerir `/review resiliencia`.
   * Se `/review resiliencia` concluído ➡️ Sugerir `/review seguranca`.
   * Se `/review seguranca` concluído ➡️ Sugerir `/review performance`.
   * Se `/review performance` concluído ➡️ Auditoria finalizada. Sugerir `/docs`.
