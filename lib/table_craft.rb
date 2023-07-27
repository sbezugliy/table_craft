# frozen_string_literal: true
require "zeitwerk"
require "phlex"
require "table_craft/version"
require "w3c_validators"
require "htmlbeautifier"
require "csv"

loader = Zeitwerk::Loader.for_gem
loader.setup

 # optionally
module TableCraft
  class Error < StandardError; end
  
  ATTRIBUTES = %i[source title cols rows border cellpadding width height header formatted output styles].freeze
  
  def self.source(source_file)
    ::TableCraft::Dsl::Source.source(source_file)
  end
end

loader.eager_load