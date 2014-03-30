# Module to contain all the application wide helpers.
module ApplicationHelper
  # Internal: Run environment check for development environment.
  #
  # Returns boolean.
  def development_environment?
    Rails.env.development?
  end

  # Internal: Define a correct base URL.
  #
  # To ease the transition between environments, this helper detects if it is
  # on a developent box and adjusts the URL's accordingly.
  #
  # Returns a string of the domain.
  def site_url
    if development_environment?
      request.protocol + request.host + ':' + request.port.to_s
    else
      request.protocol + 'rehttp.me'
    end
  end

  # Internal: Build the correct site title.
  #
  # This helps keep a consistent look across all the site by setting a standard
  # format for the title elements.
  #
  # Examples
  #
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

  # Internal: Construct the asset path with a digest attached.
  #
  # Examples
  #
  #   path_with_digest('application', 'css')
  #   # => application-a6cebf5fe429bb0eda3f1b713c05499b.css
  #
  # Returns a string of the file with the digest hash.
  def path_with_digest(filename, file_extension)
    full_filepath = "#{filename}.#{file_extension}"
    "#{filename}-#{Rails.application.assets.find_asset(full_filepath).digest}.#{file_extension}"
  end

  # Internal: Render a 404 page.
  def render_404
    render file: "#{::Rails.root}/public/404.html",
           status: '404 Not Found',
           layout: false
  end

  # Internal: Display the current version of Ruby.
  #
  # Returns a string of the version.
  def ruby_version
    RUBY_VERSION
  end

  # Internal: Get the current HEAD SHA of the codebase.
  #
  # Returns the commit SHA as a trimmed string.
  def commit_hash
    ENV['COMMIT_HASH'][0, 8] ||= 'local'
  end
end
