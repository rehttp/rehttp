$('#js-show-embed-request').click (e) ->
  e.preventDefault()
  $('#embed-response-headers').hide()
  $('#embed-response-body').hide()
  $('#embed-request-headers').show()

$('#js-show-embed-response').click (e) ->
  e.preventDefault()
  $('#embed-response-headers').show()
  $('#embed-response-body').show()
  $('#embed-request-headers').hide()
