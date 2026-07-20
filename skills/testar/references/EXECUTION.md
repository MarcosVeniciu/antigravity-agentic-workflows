# Manual de Execução: Reactive Debugger (`/testar`)

Manual de referência para análise de tracebacks e classificação de causa raiz.

---

## 1. Protocolo de Análise de Erros

### 1.1. Ingestão & Checklist (`task.md`)
Ao receber múltiplos erros no log:
1. Monte a checklist em `task.md` com base no template de suporte em `resources/error_checklist_template.md`.
2. Processe uma falha por vez marcando `[/]` ao iniciar e `[x]` ao concluir.

### 1.2. Matriz de Classificação da Causa Raiz

| Categoria | Descrição | Estratégia de Ajuste |
|---|---|---|
| **Divergência de Tipo** | Retorno ou parâmetro com tipo incompatível. | Ajustar conversão ou type hint em produção. |
| **Importação Ausente** | Módulo ou método não encontrado. | Adicionar a instrução de importação faltante. |
| **Erro de Lógica** | Asserção não bate com o valor calculado. | Corrigir a lógica de cálculo em produção. |
| **Erro de Mock/Fixture** | Fronteira mockada incorretamente. | Ajustar a configuração de mock no teste/fixture. |

---

## 2. Formato de Saída Resumido

> **Causa Raiz**: [Classificação]: [Explicação concisa em exatamente 1 frase].

[Blocos de código corrigidos com seus respectivos caminhos]

```bash
# Comando isolado para re-execução dos testes
pytest path/to/test_file.py -k test_nome

```

> **[NEXT STEP]** ➡️ *"🛠️ Correção cirúrgica aplicada e validada. Se todos os testes estiverem verdes, execute `/refatorar` (ou `/review` se estiver corrigindo um apontamento de auditoria) para continuar o fluxo."*