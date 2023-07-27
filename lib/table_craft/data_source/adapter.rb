module TableCraft
  module DataSource
    class Adapter
      
      DATA_SOURCES = ["csv", "tsv"]
      
      attr_accessor :type, :source
      attr_reader :data
      
      def initialize(type, source)
        raise NotImplementedError, 
        "Data source type: `#{type}` is not registered" unless DATA_SOURCES.include?(type)
        @source = source
        @data = public_send(type)
      end
      
      def csv
        Csv.new(@source).parse
      end
      
      def tsv
        Tsv.new(@source).parse
      end
    end
  end
end