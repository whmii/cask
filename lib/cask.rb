require "cask/engine"

cask_path = File.expand_path("../../core", __FILE__)
ENV["SASS_PATH"] = [
  ENV["SASS_PATH"],
  cask_path,
].compact.join(File::PATH_SEPARATOR)
