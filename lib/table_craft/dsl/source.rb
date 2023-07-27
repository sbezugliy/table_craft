module TableCraft
  module Dsl
    class Source
      module Syntax
        
        def build_table(&block)
          ::TableCraft::Table.new table(&block)
        end
        
        private

        def table(&block)
          ::TableCraft::Dsl::TableBuilder.new.tap { |b| b.instance_eval(&block) }.table
        end
      end

      include Syntax

      def self.source(file_path)
        new.instance_eval File.read(file_path)
      end
    end
  end
end
