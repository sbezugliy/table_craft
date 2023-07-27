module TableCraft
  module Output
    class Shell < ::TableCraft::Output::Base
      def output
        pp HtmlBeautifier.beautify(@html)
      end
    end
  end
end
