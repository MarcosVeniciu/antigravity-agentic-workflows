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

### 4. Utilizar regras pequenas e concretas
* **Descrição:** Em vez de dar instruções vagas ou abstratas, forneça regras de projeto específicas, documentações concisas ou comportamentos esperados entre serviços em formato direto.
* **Exemplo:** Em vez de falar *"Claude Code, utilize Clean Code"*, use uma regra específica: *"Sempre que você for acessar uma URL externa, utilize a classe X ou a biblioteca Y de tal maneira."*

### 5. Focar em resultados, limitações e evidências nos modelos mais fortes

* **Descrição:** Ao trabalhar com modelos mais avançados (como a linha Claude 3.5 Fable), os prompts funcionam melhor quando focados em detalhar o resultado esperado, as restrições que ele deve respeitar e as evidências de sucesso, dando autonomia lógica ao modelo.
* **Exemplo:** *"Gere um relatório de faturamento mensal. Restrição: Não use nenhuma biblioteca externa além das nativas. Evidência de sucesso: O arquivo final deve ser um CSV formatado perfeitamente com 3 colunas específicas."*


### 6. Não há necessidade de nomear ferramentas específicas nos prompts

* **Descrição:** Como o Claude Code possui uma descrição interna de quais ferramentas de sistema ele tem acesso, basta usar linguagem natural simples. Ele detectará por conta própria a melhor ferramenta integrada para o trabalho.
* **Exemplo:** Em vez de escrever *"Claude, use o Playwright para testar isto"*, basta digitar: *"Testa aí no browser."*

