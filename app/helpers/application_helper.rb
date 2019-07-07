module ApplicationHelper
  def add_stylesheet(filename, opts = { media: 'all', 'data-turbolinks-track': 'reload'})
    if Rails.application.assets.find_asset(filename + ".css")
      stylesheet_link_tag(filename, opts)
    end
  end

  def add_javascript(filename, opts = { 'data-turbolinks-track': 'reload' })
    if Rails.application.assets.find_asset(filename + ".js")
      javascript_include_tag(filename, opts)
    end
  end
end
