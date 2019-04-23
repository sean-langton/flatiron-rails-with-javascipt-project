$ ->
  $('form').submit (event) ->
    #prevent form from submitting the default way
    event.preventDefault()
    values = $(this).serialize()
    newShip = $.post('/ships', values)
    newShip.done (data) ->
      ship = data
      $('#shipName').text ship['name']
      return
    alert 'we r hack3rz'
    return
    return
  return
