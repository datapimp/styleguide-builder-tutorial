set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

activate :sprockets
activate :code_sync

helpers do
  def test_data filename
    if filename.match(/css|sass|less/)
      return JSON.generate IO.read("./source/stylesheets/examples/#{ filename }").lines.to_a
    end

    if filename.match(/js|coffee|skim|slim|haml|mustache|jst/)
      return JSON.generate IO.read("./source/javascripts/examples/#{ filename }").lines.to_a
    end
  end
end

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
end