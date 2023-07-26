# frozen_string_literal: true

require "table_craft/version"
require "w3c_validators"

module TableCraft
  class Error < StandardError; end
  # Your code goes here...
end

# require_relative "table_craft/dsl"

# Stylesheet builder
require "table_craft/styles"

# HTML table builder
require "table_craft/wrapper_tag"
require "table_craft/table"
require "table_craft/table/t_head"
require "table_craft/table/t_body"
require "table_craft/table/t_h"
require "table_craft/table/t_r"
require "table_craft/table/t_d"
