$ ->
  $('form').submit (event) ->
    #prevent form from submitting the default way
    event.preventDefault()
    values = $(this).serialize()
    newShip = $.post('/ships', values)
    newShip.done (data) ->
      ship = data
      $('#shipName').text data
      return
    return
    return
  return
