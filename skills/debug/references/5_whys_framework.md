# Framework de Investigação Forense & 5 Whys

O método dos **5 Whys** é uma técnica iterativa de interrogação usada para explorar as relações de causa e efeito subjacentes a um determinado problema de software.

## Protocolo de Execução
1. **Identificar a Falha Observada**: Comece com o sintoma visível (ex: `InternalServerError 500 em /users`).
2. **Encadear as Perguntas**: Para cada resposta fornecida, pergunte "Por quê?" novamente até atingir a causa sistêmica ou estrutural.
3. **Determinar por que o Teste Falhou em Pegar**: O 5º porquê deve obrigatoriamente responder por que a suíte de testes de unidade/integração existente permitiu que esse bug chegasse ao ambiente de runtime.
4. **Isolar a Solução Cirúrgica**: A correção deve tratar a causa raiz (5º porquê), não apenas o sintoma (1º porquê).
