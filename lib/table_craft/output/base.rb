module TableCraft
  module Output
    class Base
      def initialize(html, formatted: false)
        @formatted = formatted
        @html = html
      end
    
      private
    
      def output
        raise NotImplementedError
      end
      
      def format
        @html = HtmlBeautifier.beautify(@html)
      end
    end
  end
end
