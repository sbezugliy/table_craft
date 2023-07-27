# frozen_string_literal: true

module TableCraft
  module DataSource
    class Csv < ::TableCraft::DataSource::Base
      def parse
        @data = ::CSV.open(@source).to_a
      end
    end
  end
end
