# Melhores Práticas do Claude Code (Segundo a Anthropic)

Este guia reúne as práticas recomendadas e exemplos práticos extraídos da documentação oficial do Claude Code.

---

### 1. Incluir o método de verificação no próprio prompt
* **Descrição:** Indique explicitamente como o Claude Code deve validar a tarefa que acabou de executar para garantir que o resultado final está correto.
* **Exemplo:** 
  * *Para backend:* "Escreva a função `validateEmail`. Exemplos de caso de teste: `user@mail.com` deve retornar verdadeiro, enquanto `user@.com` deve retornar falso."
  * *Para frontend:* "Implemente esse design, tire um print do resultado, compare com o original, liste as diferenças e corrija-as."

### 2. Descrever o estado desejado em vez dos passos operacionais
* **Descrição:** Foque no resultado final que você deseja obter e deixe a ferramenta descobrir autonomamente os caminhos e arquivos necessários. Evite prescrever sequências rígidas de comandos.
* **Exemplo:** Em vez de dizer *"abra a pasta X, mude a linha Y do arquivo Z"*, use: *"Adicione um campo de telefone no formulário de cadastro de usuário e salve isso no banco de dados."* (O Claude localizará os arquivos sozinho).

### 3. Fazer refatorações em pequenos incrementos testáveis
* **Descrição:** Evite pedir alterações gigantescas ou reestruturar toda a *codebase* de uma só vez. Divida a refatoração em partes menores que possam ser testadas e validadas a cada passo.
* **Exemplo:** Em vez de pedir *"refatore todo o sistema de autenticação"*, peça primeiro *"isole a lógica de validação do token JWT nesta função e rode os testes"*.

### 4. Interromper o Claude Code imediatamente ao notar presunções erradas
* **Descrição:** Se o modelo começar a seguir por um caminho incorreto ou fizer suposições erradas sobre a arquitetura do seu projeto, interrompa o processo imediatamente e redirecione-o para economizar tempo e contexto.
* **Exemplo:** Ao ver no terminal que ele está criando arquivos em uma estrutura de pastas obsoleta ou usando uma biblioteca errada, pressione `Ctrl+C` para parar e envie um novo prompt corrigindo a rota.

### 5. Utilizar regras pequenas e concretas
* **Descrição:** Em vez de dar instruções vagas ou abstratas, forneça regras de projeto específicas, documentações concisas ou comportamentos esperados entre serviços em formato direto.
* **Exemplo:** Em vez de falar *"Claude Code, utilize Clean Code"*, use uma regra específica: *"Sempre que você for acessar uma URL externa, utilize a classe X ou a biblioteca Y de tal maneira."*

### 6. Utilizar um contexto limpo para tarefas não relacionadas
* **Descrição:** Se for iniciar uma tarefa nova que não tem relação com o histórico atual da conversa, limpe a memória do chat para evitar poluição com dados antigos e economizar tokens.
* **Exemplo:** Executar o comando na Shell interativa antes de mudar de assunto:
  ```bash
  /clear

```

### 7. Instanciar a ferramenta dentro do menor diretório possível

* **Descrição:** Se estiver trabalhando em um projeto estruturado como *monorepo*, abra o Claude Code diretamente na pasta específica do componente que você vai mexer, limitando o escopo de arquivos visíveis.
* **Exemplo:** Em um projeto com pastas separadas para `frontend` e `backend`, se a tarefa for estritamente mexer em uma regra de negócio da API, abra o terminal e inicie o Claude Code direto na pasta `/backend`.

### 8. Focar em resultados, limitações e evidências nos modelos mais fortes

* **Descrição:** Ao trabalhar com modelos mais avançados (como a linha Claude 3.5 Fable), os prompts funcionam melhor quando focados em detalhar o resultado esperado, as restrições que ele deve respeitar e as evidências de sucesso, dando autonomia lógica ao modelo.
* **Exemplo:** *"Gere um relatório de faturamento mensal. Restrição: Não use nenhuma biblioteca externa além das nativas. Evidência de sucesso: O arquivo final deve ser um CSV formatado perfeitamente com 3 colunas específicas."*

### 9. Usar modelos avançados para arquitetura e modelos rápidos para digitação de código

* **Descrição:** Aproveite os modelos mais potentes para tarefas de alto impacto alavancado (*leverage*), como planejamento e design de arquitetura, e delegue a escrita de códigos repetitivos para modelos mais rápidos.
* **Exemplo:** Usar o modelo *Fable* para criar uma especificação técnica (*spec*) de uma nova funcionalidade ou quebrar uma tarefa grande em micro-tasks, e depois colocar subagentes rodando o *Sonet* para codificar essas pequenas tarefas.

### 10. Usar a função `rewind` para pontos de controle (Checkpoints)

* **Descrição:** Se a conversa desandar e o código gerado começar a quebrar após várias interações acumuladas, use o comando interno de retrocesso para retornar o histórico a um momento onde tudo ainda funcionava.
* **Exemplo:** Se você deu 5 prompts seguidos e o último estragou a lógica, você pode usar os comandos de histórico ou o comando específico para voltar atrás:
```bash
/rewind

```


### 11. Nomear sessões de trabalho para não perder o histórico

* **Descrição:** Se precisar pausar uma implementação complexa para continuar mais tarde, dê um nome descritivo à sessão interativa atual para salvá-la localmente com todo o seu contexto.
* **Exemplo:**
```bash
/rename minha-tarefa-complexa

```


### 12. Retomar sessões salvas com o comando `resume`

* **Descrição:** Para voltar a trabalhar exatamente do ponto onde parou sem perder o histórico do raciocínio anterior, retome a sessão pelo nome em vez de iniciar um chat do zero.
* **Exemplo:**
```bash
cllaud resume minha-tarefa-complexa

```

### 13. Utilizar o comando `/go` para automação orientada a objetivos

* **Descrição:** Quando tiver uma meta clara e verificável de fim de linha, instrua o Claude Code a trabalhar em *loop* de forma contínua e autônoma até que o objetivo final seja atingido.
* **Exemplo:** *"Crie um Pull Request e trabalhe de forma autônoma até chegar a zero erros nos testes."*

### 14. Criar um arquivo específico para diretrizes de Code Review

* **Descrição:** Você pode manter um arquivo focado exclusivamente em guiar como as revisões de código devem ser feitas (usando o comando `/code review`). Mantenha regras gerais do escopo do projeto no arquivo global `claude.md` e dedique o arquivo de revisão apenas a critérios de aceitação. Para PRs complexos, especifique o nível máximo de esforço.
* **Exemplo:**
```bash
/code review --effort ultra

```

### 15. Gerenciar o contexto ativamente com o comando `/context`

* **Descrição:** Monitore com frequência quais arquivos e informações estão carregados na memória do chat. Remova manualmente o que for irrelevante para manter as respostas precisas e economizar tokens.
* **Exemplo:** Digitar o comando para inspecionar a lista de arquivos anexados e remover os que pertencem a outra tarefa concluída:
```bash
/context

```

### 16. Comitar a pasta `.cloud` de configurações do projeto

* **Descrição:** As especificações criadas na pasta `.cloud` dentro do diretório de um projeto específico devem ser enviadas ao repositório Git da equipe. Isso garante que todos usem os mesmos parâmetros de comportamento da ferramenta.
* **Exemplo:** Incluir a pasta `.cloud/` (configurações do projeto) no seu próximo commit para compartilhar as regras com o time, garantindo que você **não** adicione as configurações globais que ficam no diretório do seu usuário pessoal.

### 17. Configurar o mecanismo de restrição (ESC) para o modo automático

* **Descrição:** Se você utiliza muito o modo autônomo (*auto mode*), configure as permissões nas *settings* para exigir uma autorização humana explícita antes de realizar ações críticas ou destrutivas.
* **Exemplo:** Configurar a ferramenta para que ela seja obrigada a pedir sua permissão na tela antes de executar um comando como:
```bash
git push

```


### 18. Rodar o Claude Code em ambientes Sandbox

* **Descrição:** Para execuções contínuas e sem interrupções prolongadas em loops automáticos, execute as tarefas dentro de um ambiente isolado e seguro para evitar impactos na sua máquina principal.
* **Exemplo:** Executar o Claude Code dentro de uma máquina virtual dedicada, contêiner Docker ou através de um *Dev Container*.

### 19. Não há necessidade de nomear ferramentas específicas nos prompts

* **Descrição:** Como o Claude Code possui uma descrição interna de quais ferramentas de sistema ele tem acesso, basta usar linguagem natural simples. Ele detectará por conta própria a melhor ferramenta integrada para o trabalho.
* **Exemplo:** Em vez de escrever *"Claude, use o Playwright para testar isto"*, basta digitar: *"Testa aí no browser."*

### 20. Alterar o período de limpeza do cache local das sessões

* **Descrição:** Por padrão, o cache e histórico das sessões locais do Claude Code ficam armazenados por 30 dias na sua máquina antes de serem limpos. Você pode acessar essa pasta para auditoria ou configurar prazos customizados.
* **Exemplo:** O caminho físico padrão no seu computador onde essas sessões ficam salvas é:
```bash
~/.cloud/projects/

```