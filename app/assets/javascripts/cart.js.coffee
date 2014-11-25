class @CART
  constructor: (@cart_id) ->
    $('.plus').click @add
    $('.minus').click @minus
    $('.btn-success').click @submit

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

  submit: =>
    items = []
    $('.data-container').each (index, element) =>
      $el = $(element)
      item = JSON.parse($el.attr("data-product"))
      items.push item
    data = {"items": items}

    $.ajax(
        url: "/carts/" + @cart_id
        type: 'PUT'
        data: JSON.stringify(data),
        dataType: 'json',
        contentType: 'application/json',
        success: (data)=>
          window.location.href = '/'
      )