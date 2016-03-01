require "cask/version"

module Cask
  if defined?(Rails) && defined?(Rails::Engine)
    class Engine < ::Rails::Engine
      require 'cask/engine'
    end

    module Rails
      class Railtie < ::Rails::Railtie
        rake_tasks do
          load "tasks/install.rake"
        end
      end
    end
  else
    Sass.load_paths << File.expand_path("../../core", __FILE__)
  end
end
