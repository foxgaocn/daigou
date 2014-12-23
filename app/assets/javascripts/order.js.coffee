class @ORDER
  constructor: (@order_id) ->
    $('.save-address').click @add_address
    $('.new-address').click @new_address

  new_address: (event) =>
    @target_id = $(event.target).data('id').toString()


  add_address: (event)=>
    name = $('#name').val().trim()
    street = $('#street').val().trim()
    postcode = $('#postcode').val().trim()
    phone = $('#phone').val().trim()

    if(name == "" || street == "" || postcode == "" || phone == "")
      alert("请输入完整信息")
      return
    
    $.post("/addresses.json",
          { "address" : { "name": name, "street": street, "post_code": postcode, "phone_number": phone} },
          (data) => @update_address_list(data)
      ).fail( (jqXHR, textStatus, errorThrown) =>
        alert(jqXHR.responseText)
      )



  update_address_list: (address) =>
    selectElements = $('.address-select')
    for selectElement in selectElements
      newNode = $("<option value='#{address.id}'> #{address.name}  #{address.street}  #{address.phone_number} </option>")
      newNode.insertAfter(selectElement.firstElementChild) 
      if selectElement.getAttribute('data-package-id') == @target_id
        newNode.attr('selected', 'selected')
    $('#myModal').modal('hide')

  go_previous: (index) =>
    @set_button(index)

  go_next: (index) =>
    switch index
      when 1 then return @save_address()
      when 2 then return @pay()
      else return @wrong_index

  save_address: =>
    addresses = $('.address-select')
    empty_address = @find_empty_address(addresses)
    
    if empty_address?
      alert('请输入包裹寄送地址')
      empty_address.focus()
      return false

    params = {}
    params.packages = []
    for address in addresses
      do ->
        pack = {}
        pack.package_id = parseInt(address.getAttribute('data-package-id'))
        pack.address_id = parseInt(address.value)
        params.packages.push pack

    
    $.ajax(
      url: "/orders/" + @order_id + "/packages/batch_update"
      type: 'POST'
      data: JSON.stringify(params),
      dataType: 'json',
      contentType: 'application/json'
    ).fail( (jqXHR, textStatus, errorThrown) =>
        alert('对不起，保存地址出错了，请与我们联系')
        window.location.href = "/"
      )

    return true

  pay: =>
    $.ajax(
      url: "/orders/" + @order_id + "/confirm"
      type: 'POST'
      contentType: 'application/json',
      success: (data) =>
        @empty_cart()
        window.location.href = "/orders/" + @order_id + "/confirmed"
    ).fail( (jqXHR, textStatus, errorThrown) =>
        alert('对不起，提交订单出错了，请与我们联系')
        window.location.href = "/"
      )
    return true


  empty_cart: ->
    $.ajax(
      url: "/carts/clear"
      type: 'POST'
      contentType: 'application/json',
      success: (data) ->
        $('.badge').text(0)
    ).fail( (jqXHR, textStatus, errorThrown) =>
        alert('对不起，清空购物车出错了，请与我们联系')
        window.location.href = "/"
      )

  wrong_index: =>
    return false

  find_empty_address: (addresses) ->
    empty_address = null
    
    for address in addresses
      if(address.value == "")
        do ->
          empty_address = address 
        break
    return empty_address

  set_button: (index) ->
    if(index == 0)
      $('#rootwizard').find('.pager .previous').hide();
    else
      $('#rootwizard').find('.pager .previous').show();
    if(index == 1)
      $('#rootwizard').find('.pager .next').hide();
      finishButton = $('#rootwizard').find('.pager .finish')
      finishButton.show();
      finishButton.removeClass('disabled')
    else
      $('#rootwizard').find('.pager .next').show();
      $('#rootwizard').find('.pager .finish').hide();





    