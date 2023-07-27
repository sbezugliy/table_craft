# frozen_string_literal: true

module TableCraft
  module Dsl
    class TableBuilder
      attr_reader :table

      def initialize
        @table = ::TableCraft::Table.new
      end

      ::TableCraft::ATTRIBUTES.each do |attribute|
        define_method(attribute) do |*arg, &block|
          value = block.is_a?(Proc) ? block.call : arg
          table.public_send(attribute.to_s, *value)
        end
      end
    end
  end
end
