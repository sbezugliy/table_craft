module TableCraft
  module Output
    class Print < ::TableCraft::Output::Base
      def output(_path)
        puts HtmlBeautifier.beautify(@html)
      end
    end
  end
end
