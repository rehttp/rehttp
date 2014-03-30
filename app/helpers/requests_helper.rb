require 'securerandom'

# Helper for the Requests class.
module RequestsHelper
  # Internal: Create an 8 character UUID.
  #
  # Returns a UUID of a string.
  def create_uuid
    SecureRandom.uuid[0, 8]
  end

  # Internal: Format a HTTP header output.
  #
  # This method captializes the first letter of each word and after each
  # hyphen.
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

  # Internal: Determine if the given string contains JSON.
  #
  # Used for checking HTTP content-type headers to apply correct formatting.
  #
  # Returns boolean.
  def json_response?(header_string)
    header_string.include? 'json'
  end

  # Internal: Display available request methods.
  #
  # Returns array of HTTP request verbs.
  def request_method_options
    %w(GET POST PUT DELETE OPTIONS HEAD PATCH)
  end
end
