class @CART
  constructor: ->
    $('.plus').click @add
    $('.minus').click @minus

  add: (event)=>
    dataNode = $(event.target.parentElement.previousElementSibling)
    newValue = parseInt(dataNode.val()) + 1
    @update_data_node(dataNode, newValue)
    

  minus: (event) =>
    dataNode = $(event.target.parentElement.nextElementSibling)
    oldValue = parseInt(dataNode.val())
    newValue = if oldValue < 1 then 0 else oldValue - 1
    @update_data_node(dataNode, newValue)

  update_data_node: (dataNode, value) ->
    dataNode.val(value)

    dataProduct = JSON.parse(dataNode.attr("data-product"))
    dataProduct.quantity = value
    dataNode.attr("data-product", JSON.stringify(dataProduct))