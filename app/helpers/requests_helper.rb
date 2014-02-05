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

  # Build a usable HTTP query string.
  #
  # Returns a string containing the URL and all the parameters separated by an
  # ampersand.
  def build_query_string(url, all_parameters)
    query_parameters ||= []

    all_parameters.split("\r\n").each do |parameter|
      query_parameters << parameter
    end

    return url + '?' + query_parameters.join('&')
  end
end
