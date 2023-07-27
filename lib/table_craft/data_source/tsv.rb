module TableCraft
  module DataSource
    class Tsv < ::TableCraft::DataSource::Base
      def parse
        @data = CSV.parse(source,‘r’,"\t")
      end
    end
  end
end