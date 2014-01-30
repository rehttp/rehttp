$('#request').bind 'ajax:success', (evt, data, status) ->
  $.ajax {
    url: '/r/' + data
    type: 'GET',
    success: (html) ->
      $('#response').html(html)
    error: (a, b, c) ->
      # Log this error
  }
