class @COLLAPSE
  constructor: () ->
    @set_collaps()
    $(window).resize @set_collaps
    $('#collapseListGroup1').on 'shown.bs.collapse', @show
    $('#collapseListGroup1').on 'hidden.bs.collapse', @hide


  set_collaps: ->
    if $(window).width() < 768
      $('#collapseListGroup1').collapse('hide')
      $('#cat_title > i').remove()
      $('#cat_title').append('<i class="fa fa-angle-double-down"></i>')
    else
      $('#collapseListGroup1').collapse('show')
      $('#cat_title > i').remove()
      $('#cat_title').append('<i class="fa fa-angle-double-up"></i>')
     

  hide: ->
    $('#cat_title > i').remove()
    $('#cat_title').append('<i class="fa fa-angle-double-down"></i>')

  show: ->
    $('#cat_title > i').remove()
    $('#cat_title').append('<i class="fa fa-angle-double-up"></i>')