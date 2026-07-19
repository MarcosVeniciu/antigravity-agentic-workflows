# Exemplo de Sucesso de Modelagem BDD

Funcionalidade: Checkout Expresso com Padrão BR-101
  Para que eu possa reduzir a fricção de compra
  Como um cliente autenticado na plataforma
  Eu quero finalizar meu pedido usando o saldo pré-carregado

  Cenário: Checkout com saldo suficiente
    Dado que o cliente possui R$ 150,00 de saldo na carteira interna
    E o carrinho de compras totaliza R$ 90,00
    Quando o cliente aciona o botão "Finalizar com 1-Clique"
    Então o sistema deve debitar R$ 90,00 do saldo do cliente
    E o pedido deve ser encaminhado para o status "Aprovado"
    E a nota Obsidian [[2026-financial-rules]] deve ser respeitada