module TableCraft
  module Output
    class Adapter
      
      OUTPUTTERS = ["file", "print"]
      
      attr_accessor :type, :source
      attr_reader :data
      
      def initialize(type, source, formatted = false)
        raise NotImplementedError, 
        "Data source type: `#{type}` is not registered" unless OUTPUTTERS.include?(type)
        @formatted=formatted
        @source = source
        @data = public_send(type)
      end
      
      def file
        HtmlFile.new(@source, @path, formatted?)
      end
      
      def print
        Print.new(@source, formatted?)
      end
      
      def formatted?
        return true if @formatted=="formatted"
        false
      end
    end
  end
end