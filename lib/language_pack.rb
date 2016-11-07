require "pathname"
require 'benchmark'

# General Language Pack module
module LanguagePack
  module Helpers
  end

  # detects which language pack to use
  # @param [Array] first argument is a String of the build directory
  # @return [LanguagePack] the {LanguagePack} detected
  def self.detect(*args)
    Instrument.instrument 'detect' do
      Dir.chdir(args.first)
      return Ruby.new(*args)
    end
  end
end


$:.unshift File.expand_path("../../vendor", __FILE__)
$:.unshift File.expand_path("..", __FILE__)

require 'dotenv'
require 'language_pack/shell_helpers'
require 'language_pack/instrument'
require "language_pack/helpers/plugin_installer"
require "language_pack/helpers/stale_file_cleaner"
require "language_pack/helpers/rake_runner"
require "language_pack/helpers/bundler_wrapper"

require "language_pack/ruby"
