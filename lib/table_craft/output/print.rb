module TableCraft
  module Output
    class Print < ::TableCraft::Output::Base
      def output(_path)
        pp HtmlBeautifier.beautify(@html)
      end
    end
  end
end
