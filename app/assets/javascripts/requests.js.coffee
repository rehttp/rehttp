$('#request').bind 'ajax:success', (evt, data, status) ->
  $.ajax {
    url: '/r/' + data
    type: 'GET',
    success: (html) ->
      $('#response').html(html)
    error: (a, b, c) ->
      # Log this error
  }

$('#js-add-request-basic-auth').click ->
  $('#js-add-request-basic-auth').hide()
  $('#request-basic-auth').show()

$('#js-hide-request-basic-auth').click ->
  $('#js-add-request-basic-auth').show()
  $('#request-basic-auth').hide()
