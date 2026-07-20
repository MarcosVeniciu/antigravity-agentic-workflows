# Melhores Práticas e Governança de Agentes (Antigravity & Claude Code)

Este guia reúne as práticas recomendadas oficiais para extrair o máximo de inteligência dos agentes, somadas às regras rígidas de governança de contexto da Antigravity IDE.

---

## PARTE 1: Governança de Erros e Controle de Contexto (Padrão Antigravity)

Para manter a alta performance da IA ao longo do desenvolvimento contínuo, a Antigravity Engine adota regras estritas de higiene de contexto:

### 1. Tolerância a Falhas e Regra do "Duplo Strike"
* **A Regra:** Operações mutativas de código (especialmente a implementação pelo agente `/codigo` na Fase 2) possuem um limite rígido de tentativas.
* **O Processo:** Se o agente tentar implementar uma solução e o código quebrar, ele pode tentar consertar apenas mais uma vez no mesmo chat. Se falhar na **2ª tentativa consecutiva** (*Duplo Strike*), o agente está **proibido** de continuar tentando.
* **Rollback & Handover:** O agente deve obrigatoriamente executar `git reset --hard HEAD` (para limpar o estado do código), interromper sua execução e orientar o usuário a abrir um **novo chat** chamando o agente reativo `/testar`.

### 2. Higiene de Contexto em Depuração Reativa (O Isolamento)
* **A Regra:** Nunca debugar erros complexos no mesmo chat em que você está construindo a feature.
* **O Processo:** Tracebacks de erros, logs de testes falhos e saídas longas de terminal (*stack traces*) poluem massivamente a janela de tokens. Isso dilui a atenção do modelo e corrompe as diretrizes originais do fluxo TDD.
* **Ação:** Agentes de correção como o **`/testar`** (para ajustes cirúrgicos em código de produção a partir de testes falhos) e o **`/debug`** (para análise de causa raiz / 5 Whys) devem ser invocados **exclusivamente em janelas de chat recém-criadas e limpas**. Assim que o bug for resolvido, esse chat reativo deve ser encerrado.

---

## PARTE 2: Melhores Práticas de Prompting

### 3. Incluir o método de verificação no próprio prompt
* **Descrição:** Indique explicitamente como o LLM deve validar a tarefa que acabou de executar para garantir que o resultado final está correto.
* **Exemplo:** * *Backend:* "Escreva a função `validateEmail`. Exemplos: `user@mail.com` retorna verdadeiro, `user@.com` retorna falso."
  * *Frontend:* "Implemente o componente, verifique visualmente, liste as diferenças e corrija-as."

### 4. Descrever o estado desejado em vez dos passos operacionais
* **Descrição:** Foque no resultado final esperado e deixe a ferramenta descobrir autonomamente os caminhos. Evite prescrever sequências rígidas (microgerenciamento).
* **Exemplo:** Em vez de *“abra a pasta X, mude a linha Y do arquivo Z”*, use: *“Adicione um campo de telefone no formulário de cadastro de usuário e salve isso no banco de dados.”*

### 5. Fazer refatorações em pequenos incrementos testáveis
* **Descrição:** Evite pedir para reestruturar toda a *codebase* de uma vez. Divida a refatoração em partes menores que possam ser validadas passo a passo.
* **Exemplo:** Em vez de pedir *“refatore todo o módulo de pagamentos para SOLID”*, utilize a sequência do fluxo de desenvolvimento ou peça: *“Refatore apenas a extração da interface do Gateway de Pagamento e rode os testes antes de prosseguir”*.

### 6. Utilizar regras pequenas e concretas
* **Descrição:** Em vez de dar instruções abstratas, forneça regras técnicas específicas e definitivas.
* **Exemplo:** Em vez de falar *“Use boas práticas de Clean Code”*, determine: *“Sempre que for acessar uma URL externa, utilize injeção de dependência via HttpClient.”*

### 7. Focar em resultados e limitações nos modelos de fronteira
* **Descrição:** Ao trabalhar com modelos topo de linha (Claude 3.5 Sonnet / Gemini 1.5 Pro), detalhe o resultado esperado, as restrições que ele não pode quebrar e as evidências de sucesso. Eles possuem alta autonomia lógica.
* **Exemplo:** *"Gere o endpoint. Restrição: Não use nenhuma biblioteca externa além da Standard Library. Evidência de sucesso: Resposta JSON contendo o array formatado em menos de 100ms."*

### 8. Não é necessário nomear ferramentas integradas
* **Descrição:** A IDE fornece automaticamente as descrições de ferramentas (MCPs, leitura de arquivo, busca de terminal) via protocolo. Use linguagem natural.
* **Exemplo:** Em vez de *“Use a ferramenta vault_read do Obsidian para ler o SDD”*, diga apenas: *“Leia o contrato SDD no Obsidian”*.