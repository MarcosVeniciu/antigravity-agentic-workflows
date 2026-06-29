# Auditoria e Refatoração

Após a "Green Phase" do TDD, o código funciona. Porém, código que funciona não é sinônimo de código limpo. O ciclo de auditoria do Antigravity eleva o padrão de entrega através da dupla `/review` e `/refatorar`.

## Senior Code Auditor (`/review`)

Um auditor que **não corrige código**, apenas inspeciona. Sua metodologia é rígida e orientada por checklists do Obsidian:
- **Modularidade:** É possível evocar tipos de review específicos: `/review performance`, `/review arquitetura`, `/review seguranca`, etc.
- **Verificação Mecânica:** Ele procura por métricas exatas (como laços O(n^2), quebras de Single Responsibility, ou falta de sanitização OWASP).
- **Relatório Direcionado:** O output é um sumário de severidades (Crítico, Maior, Menor) que funciona como input obrigatório para a próxima etapa.

## Clean Code Specialist (`/refatorar`)

O refatorador não cria novas features. Ele pega o código funcional e o relatório do auditor, e reestrutura.
- **SOLID na Prática:** Extrai responsabilidades únicas, inverte dependências e limpa *code smells* (funções gigantes, deep nesting).
- **Sem alteração de Comportamento:** Após a refatoração, o sistema orienta o usuário a re-rodar a suíte de testes para atestar que as assinaturas e comportamentos de negócio continuam íntegros.

Esse ciclo iterativo garante que o débito técnico se aproxime de zero a cada nova funcionalidade implementada no repositório.
