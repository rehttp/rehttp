module ApplicationHelper
  # Define a correct base URL.
  #
  # To ease the transition between environments, this helper detects if it is on
  # a developent box and adjusts the URL's accordingly.
  #
  # Returns a string of the domain.
  def site_url
    if ENV['RACK_ENV'] == 'development'
      request.protocol + request.host + ':' + request.port.to_s
    else
      request.protocol + 'rehttp.me'
    end
  end

  # Build the correct site title.
  #
  # This helps keep a consistent look across all the site by setting a standard
  # format for the title elements.
  #
  # Example:
  #   No page name defined  => ReHTTP
  #   Page name defined     => Page name · ReHTTP
  #   Sub page name defined => Sub page · Parent · ReHTTP
  #
  # Returns a string.
  def title
    site_name = 'ReHTTP'

    if @sub_page_name.present? && @page_name.present?
      return "#{@sub_page_name} · #{@page_name} · #{site_name}"
    elsif @page_name.present?
      return "#{@page_name} · #{site_name}"
    else
      return site_name
    end
  end
end
