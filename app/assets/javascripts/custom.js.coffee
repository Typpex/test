# Fires whenever a player has finished loading
onPlayerReady = (event) ->
  event.target.playVideo()

# Fires when the player's state changes.
onPlayerStateChange = (event) ->
  # Go to the next video after the current one is finished playing
  if event.data == 0
    $.fancybox.next()

DetectTimeZone = ()->
  d = new Date()
  # Retrieve the difference between the GMT and local time in minutes !
  tz = d.getTimezoneOffset()
  # Convert to hour...
  tz = tz / 60
  # Reverse to get local - GMT
  tz = -tz
  found = false
  # Browse the timezone list element
  $.each $("#user_localization_time_zone").children(), (index, value) ->
    # Extract the hour part of a given timezone
    result = /GMT([-|+]\d{2})/i.exec($(value).html())
    if result != null
      current_tz = result[1]
      # Cast string hour into a number
      current_tz = parseInt(current_tz)
      if current_tz == tz && found == false
        found = true
        $(value).attr("selected", true)

# Executed when page is loaded
$ ->
  $('#phone-carousel, .phone-carousel').carousel(); 

  # Enable the modal in how-to page under keyword tab
  $("#list-functions").on 'click', (e)->
    $("#functionsModal").modal()

  # Enable main page video modal
  $(".fancybox").fancybox 
    padding: 0
    width: 600
    height: 400
    beforeShow: ->
      # Find the iframe ID
      id = $.fancybox.inner.find('iframe').attr('id')
      # Create video player object and add event listeners
      player = new (YT.Player)(id, events:
        'onReady': onPlayerReady
        'onStateChange': onPlayerStateChange)

  # Enable subscription modal
  $(".btn-subscribe").fancybox
    width: 800
    height: 352
    beforeShow: ->
      this.inner.empty()
      this.inner.prepend($("#subscribe").html())

  # Enable login modal
  $(".login-btn").fancybox
    width: 400
    height: 350
    beforeShow: ->
      this.inner.empty()
      this.inner.prepend($("#login").html())

  DetectTimeZone()





