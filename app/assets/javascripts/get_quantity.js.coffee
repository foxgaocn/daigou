$ ->
  $.get("/carts/item_quantity.json",
      (data) =>
        quantity = data.quantity
        $('.badge').addClass('non-empty-cart') if quantity > 0
        $('.badge').text(quantity)
      ).fail( ->
        alert('whoops, something is wrong')
      )
