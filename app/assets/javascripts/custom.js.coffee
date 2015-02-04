# Fires whenever a player has finished loading
onPlayerReady = (event) ->
  event.target.playVideo()
  return

# Fires when the player's state changes.
onPlayerStateChange = (event) ->
  # Go to the next video after the current one is finished playing
  if event.data == 0
    $.fancybox.next()
  return

$ ->
  $('#phone-carousel, .phone-carousel').carousel(); 
  # $('.btn-u.btn-u-lg.re-btn-brd.margin-right-5').on 'click', (e) ->
  #   $('#myModal').modal(keyboard: true)
  #   player.playVideo()

  # $("#myModal").on "hidden.bs.modal", (e) ->
  #   player.stopVideo()
  $("#list-functions").on 'click', (e)->
    $("#functionsModal").modal()

  $(".fancybox").fancybox 
    padding: 0
    width: 600
    height: 600
    beforeShow: ->
      # Find the iframe ID
      id = $.fancybox.inner.find('iframe').attr('id')
      # Create video player object and add event listeners
      player = new (YT.Player)(id, events:
        'onReady': onPlayerReady
        'onStateChange': onPlayerStateChange)

