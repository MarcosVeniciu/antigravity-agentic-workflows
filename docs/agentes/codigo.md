# Agente de Código (`/codigo`) - A Fase Verde (Green Phase)

O agente de **Código** é o braço de execução técnica da Fase 2 do TDD. Ele é ativado assim que a suíte de testes (Fase Vermelha) e seus stubs estão posicionados no projeto, atuando exclusivamente para fazer os testes passarem (**Fase Verde**).

---

## 1. Princípio da Lógica Mínima Necessária

O objetivo central deste agente é escrever a **menor quantidade de código funcional** para satisfazer as asserções dos testes existentes.

- **Prevenção de Escopo Fantasma:** O agente não implementa métodos adicionais, abstrações não solicitadas ou bibliotecas desnecessárias. Se não houver um teste cobrindo a funcionalidade, ela não é escrita.
- **Redução Cognitiva via checklist (`task.md`):** O agente constrói um checklist iterativo `task.md` e trabalha em uma tarefa por vez (`[/] -> [x]`), mantendo o foco absoluto.

---

## 2. Qualidade Estrutural e Docstrings

Embora focado na aprovação dos testes:
- **SOLID & Clean Code:** Sempre que aplica um princípio SOLID, o agente explicita o motivo nos comentários ou docstrings.
- **Docstrings Estruturadas:** Todas as funções e classes recebem docstrings completas (propósito, argumentos, retornos e exceções).
- **Rastreabilidade:** Adiciona referências à nota correspondente no Obsidian quando aplica regras de negócio (`Ref: Obsidian note [[note-name]]`).

---

## 3. Restrição de Terminal

O agente não executa comandos de terminal de forma autônoma. Ao terminar a escrita do código, fornece um único bloco bash isolado com o comando de teste para validação pelo usuário.

---

## 🔀 Arquitetura Router & Skill

* **Agente Roteador:** `agents/codigo.md`
* **Skill Associada:** `skills/codigo/`
* **Referências de Execução:** `skills/codigo/references/EXECUTION.md`
