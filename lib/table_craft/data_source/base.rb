# frozen_string_literal: true

module TableCraft
  module DataSource
    class Base
      attr_writer :source
      attr_reader :data

      def initialize(source)
        @source = source
      end
    end
  end
end
