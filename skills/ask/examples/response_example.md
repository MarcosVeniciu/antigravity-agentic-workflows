# Exemplo de Resposta Ideal (Few-Shot Learning)

Este arquivo serve como demonstração prática para o modelo de como estruturar respostas para o comando `/ask`, garantindo rastreabilidade absoluta, concisão e conformidade com as restrições de leitura.

---

### 📥 Pergunta Exemplo do Usuário
> "Como funciona a validação de cobertura de testes no pipeline de CI e qual arquivo gerencia isso?"

### 📤 Resposta Exemplo do Agente (Project Oracle)

Com base na análise do repositório e da base de conhecimento do Obsidian, aqui estão os detalhes sobre a validação de cobertura de testes:

#### 1. Regra de Negócio e Governança
A validação de cobertura foi estabelecida para garantir que nenhuma alteração de código reduza o índice global de testes abaixo da meta mínima estipulada pelo time de engenharia. 
* A meta de cobertura global está definida em **90%**.
* Caso a cobertura fique abaixo desse patamar, o script interrompe a execução retornando um código de falha (`sys.exit(1)`), impedindo o avanço do pipeline.

Essa diretriz está documentada na nota core de convenções do projeto: `[[conventions]]`.

#### 2. Implementação Técnica
A lógica de verificação é executada de forma automatizada por um script utilitário em Python. Ele faz a leitura de um arquivo JSON gerado pela ferramenta de cobertura e analisa o campo de totais.

O código correspondente está implementado na pasta de skills do agente de engenharia:
* Arquivo de verificação: [`verify_coverage.py`](file:///project/.agents/skills/codigo/scripts/verify_coverage.py#L70-L80)