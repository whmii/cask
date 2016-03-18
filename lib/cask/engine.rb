require "cask/version"
require "fileutils"
require "thor"
require "pathname"

module Cask
  class Generator < Thor
    map ["-v", "--version"] => :version

    desc "install", "Install Cask into your project"
    method_options :path => :string, :force => :boolean
    def install
      if cask_files_already_exist? && !options[:force]
        puts "Cask files already installed, doing nothing."
      else
        install_files
        puts "Cask files installed to #{install_path}/"
      end
    end

    desc "update", "Update Cask"
    method_options :path => :string
    def update
      if cask_files_already_exist?
        remove_cask_directory
        install_files
        puts "Cask files updated."
      else
        puts "No existing cask installation. Doing nothing."
      end
    end

    desc "version", "Show Cask version"
    def version
      say "Cask #{Cask::VERSION}"
    end

    private

    def cask_files_already_exist?
      install_path.exist?
    end

    def install_path
      @install_path ||= if options[:path]
          Pathname.new(File.join(options[:path], "cask"))
        else
          Pathname.new("cask")
        end
    end

    def install_files
      make_install_directory
      copy_in_scss_files
    end

    def remove_cask_directory
      FileUtils.rm_rf("cask")
    end

    def make_install_directory
      FileUtils.mkdir_p(install_path)
    end

    def copy_in_scss_files
      FileUtils.cp_r(all_stylesheets, install_path)
    end

    def all_stylesheets
      Dir["#{stylesheets_directory}/*"]
    end

    def stylesheets_directory
      File.join(top_level_directory, "core")
    end

    def top_level_directory
      File.dirname(File.dirname(File.dirname(__FILE__)))
    end
  end
end
