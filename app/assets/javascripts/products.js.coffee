# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class @PRODUCT
  constructor: (@product_id) ->
    $('.add').click @add_to_cart
    $('.plus').click @add
    $('.minus').click @minus

  add_to_cart: (event) =>
    quantity = $("#count").val()
    if(quantity <= 0)
      alert('数量不能为0')
      return
    
    $.post("/carts/add_item.json",
          { "cart_item" : { "product_id": @product_id, "quantity": quantity} },
          (data) => @set_badge(data)
           
      ).fail( (jqXHR, textStatus, errorThrown) =>
        alert('whoops, something is wrong')
      )

  set_badge: (data) ->
    quantity = data.quantity
    $('.badge').addClass('non-empty-cart') if quantity > 0
    $('.badge').text(quantity)


   add: (event)=>
    dataNode = $('#count')
    newValue = parseInt(dataNode.val()) + 1
    dataNode.val(newValue)
    

  minus: (event) =>
    dataNode = $('#count')
    oldValue = parseInt(dataNode.val())
    newValue = if oldValue < 1 then 0 else oldValue - 1
    dataNode.val(newValue)
