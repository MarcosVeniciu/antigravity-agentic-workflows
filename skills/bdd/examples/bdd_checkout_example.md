# Exemplo de Modelagem BDD de Alto Padrão

Feature: Cadastro de Produtor Rural
  In order to gerenciar dados de propriedades e permitir diagnósticos personalizados
  As a Consultor técnico do sistema
  I want cadastrar novos produtores rurais com autenticação segura

  @happy-path
  Scenario: Cadastro bem-sucedido com dados válidos
    Given que não existe nenhum produtor cadastrado com o e-mail "produtor@fazenda.com.br"
    When o consultor submete o formulário de cadastro com e-mail, nome da fazenda e senha segura
    Then o produtor deve ser registrado com sucesso no sistema
    And um identificador único de produtor deve ser gerado
    And os dados da fazenda devem ficar disponíveis para novos diagnósticos

  @unhappy-path @validation
  Scenario: Tentativa de cadastro com e-mail duplicado
    Given que já existe um produtor cadastrado com o e-mail "produtor@fazenda.com.br"
    When o consultor tenta cadastrar outro produtor utilizando o mesmo e-mail
    Then o sistema deve rejeitar o cadastro com aviso de duplicidade
    And nenhuma nova fazenda deve ser criada no repositório
