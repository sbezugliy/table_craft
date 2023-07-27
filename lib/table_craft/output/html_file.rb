module TableCraft
  module Output
    class HtmlFile < ::TableCraft::Output::Base
      def output(path)
        format #if @formatted
        @path = path
        ensure_path
        save
      end
      
      private
      
      def save
        File.write(@path, @html)
      end
      
      def ensure_path
        FileUtils.mkdir_p File.dirname(@path)
      end
    end
  end
end
