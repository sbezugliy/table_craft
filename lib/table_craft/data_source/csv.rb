module TableCraft
  module DataSource
    class Csv < ::TableCraft::DataSource::Base
      
      def parse
        @data = CSV.parse(data)
      end
    end
  end
end