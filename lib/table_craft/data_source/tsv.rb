# frozen_string_literal: true

module TableCraft
  module DataSource
    class Tsv < ::TableCraft::DataSource::Base
      def parse
        @data = ::CSV.open(@source, col_sep: "\t").to_a
      end
    end
  end
end
