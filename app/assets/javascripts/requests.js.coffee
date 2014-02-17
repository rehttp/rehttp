$('#request').bind 'ajax:success', (evt, data, status) ->
  $.ajax {
    url: '/r/' + data
    type: 'GET',
    success: (html) ->
      $('#response').html(html)
      $('pre code').each (i, e) ->
        hljs.highlightBlock(e)
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

# Parameter container and interaction.
$('#js-add-request-parameter').click (e) ->
  $('#js-add-request-parameter').hide()
  $('#js-request-parameters-container').show()

$('#js-hide-request-parameters-container').click (e) ->
  e.preventDefault()
  $('#request_parameters').val('')
  $('#js-request-parameters-container').hide()
  $('#js-add-request-parameter').show()

# Header container and interaction.
$('#js-request-add-headers').click (e) ->
  $('#js-request-add-headers').hide()
  $('#js-request-headers-container').show()

$('#js-hide-request-headers-container').click (e) ->
  e.preventDefault()
  $('#request_headers').val('')
  $('#js-request-add-headers').show()
  $('#js-request-headers-container').hide()

# Payload container and interaction.
$('#request_type').change ->
  if $('#request_type').val() == 'POST' || $('#request_type').val() == 'PUT' || $('#request_type').val() == 'PATCH'
    $('#request-payload-group').show()
  else
    $('#request-payload-group').hide()

$('#js-request-add-payload').click (e) ->
  $('#js-request-add-payload').hide()
  $('#js-request-payload-container').show()

$('#js-hide-request-payload-container').click (e) ->
  e.preventDefault()
  $('#request_payload').val('')
  $('#js-request-add-payload').show()
  $('#js-request-payload-container').hide()
