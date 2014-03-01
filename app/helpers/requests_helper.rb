module RequestsHelper
  # Format a HTTP header output.
  #
  # This method captializes the first letter of each word and after each hyphen.
  #
  # Example:
  #
  #   cache-control    => Cache-Control
  #   x-frame-options  => X-Frame-Options
  #   x-xss-protection => X-Xss-Protection
  #
  # Returns a formatted string.
  def format_http_header(word)
    word.gsub(/\w+|-/, &:capitalize)
  end

  # Determine if the response is JSON.
  #
  # Using the content-type header, check if JSON is defined within it.
  #
  # Returns boolean.
  def json_response?(header_string)
    if header_string.include? 'json'
      return true
    else
      return false
    end
  end
end
