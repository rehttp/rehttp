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

$('#js-hide-request-basic-auth').click (e) ->
  e.preventDefault()

  # Be sure to empty the values of the fields so as not to trigger the
  # authentication headers being applied when hiding the fields.
  $('.auth_username').val('')
  $('.auth_password').val('')

  $('#js-add-request-basic-auth').show()
  $('#request-basic-auth').hide()

$('#js-add-request-parameter').click (e) ->
  e.preventDefault()
  $('#js-add-request-parameter').hide()
  $('#js-request-parameters-container').show()

$('#js-request-add-headers').click (e) ->
  e.preventDefault()
  $('#js-request-add-headers').hide()
  $('#js-request-headers-container').show()
