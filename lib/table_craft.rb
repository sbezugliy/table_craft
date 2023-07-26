# frozen_string_literal: true

require_relative "table_craft/version"

module TableCraft
  class Error < StandardError; end
  # Your code goes here...
end

# require_relative "table_craft/dsl"

require "table_craft/wrapper_tag"
require "table_craft/table"
require "table_craft/table/t_head"
require "table_craft/table/t_body"
require "table_craft/table/t_h"
require "table_craft/table/t_r"
require "table_craft/table/t_d"