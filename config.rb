set :css_dir, 'assets/stylesheets'

set :js_dir, 'assets/javascripts'

set :images_dir, 'assets/images'

activate :relative_assets

set :relative_links, true

activate :autoprefixer

set :haml, { :ugly => true, :format => :html5 }

configure :build do

end
