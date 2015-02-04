$ ->
  $('#phone-carousel, .phone-carousel').carousel(); 
  $('.btn-u.btn-u-lg.re-btn-brd.margin-right-5').on 'click', (e) ->
    $('#myModal').modal(keyboard: true)
    player.playVideo()

  $("#myModal").on "hidden.bs.modal", (e) ->
    player.stopVideo()
  $("#list-functions").on 'click', (e)->
    $("#functionsModal").modal()
