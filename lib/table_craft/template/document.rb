# frozen_string_literal: true

module TableCraft
  module Template
    class Document < ::Phlex::HTML
      def initialize(header, data, table_attrs)
        @header = header
        @data = data
        @table_attrs = table_attrs
        super()
      end

      def template
        doctype

        html do
          head do
            title { yield(:title) }
            style { yield(:styles) }
          end

          body do
            render(::TableCraft::Template::TableComponent.new(@header, @data, @table_attrs))
          end
        end
      end
    end
  end
end
