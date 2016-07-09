require "cask/version"
require "fileutils"
require "thor"

module Cask
  class Generator < Thor
    map ["-v", "--version"] => :version

    desc "install", "Install Cask into your project"
    def install
      if cask_files_already_exist?
        puts "Cask files already installed, doing nothing."
      else
        install_files
        puts "Cask files installed to cask/"
      end
    end

    desc "update", "Update Cask"
    def update
      if cask_files_already_exist?
        remove_cask_directory
        install_files
        puts "Cask files updated."
      else
        puts "No existing Cask installation. Doing nothing."
      end
    end

    desc "remove", "Remove Cask"
    def remove
      if cask_files_already_exist?
        remove_cask_directory
        puts "Cask was successfully removed."
      else
        puts "No existing Cask installation. Doing nothing."
      end
    end

    desc "version", "Show Cask version"
    def version
      say "Cask #{Cask::VERSION}"
    end

    private

    def cask_files_already_exist?
      File.directory?("cask")
    end

    def install_files
      FileUtils.mkdir_p("cask")
      FileUtils.cp_r(all_stylesheets, "cask/")
    end

    def remove_cask_directory
      FileUtils.rm_rf("cask")
    end

    def all_stylesheets
      Dir["#{stylesheets_directory}/*"]
    end

    def stylesheets_directory
      File.join(top_level_directory, "app", "assets", "stylesheets")
    end

    def top_level_directory
      File.dirname(File.dirname(File.dirname(__FILE__)))
    end
  end
end
