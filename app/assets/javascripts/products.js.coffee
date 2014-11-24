# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class @PRODUCT
  constructor: (@product_id) ->
    $('.add').click @add_to_cart

  add_to_cart: (event) =>
    quantity = $("#count").val()

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
