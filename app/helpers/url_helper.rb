module UrlHelper
  def url_with_default_protocol(url)
    url.match(/^http/i) ? url : "https://#{url}"
  end
end
