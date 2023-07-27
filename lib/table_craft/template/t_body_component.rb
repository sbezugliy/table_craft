# frozen_string_literal: true

module TableCraft
  module Template
    class TBodyComponent < ::Phlex::HTML
      def initialize(data = [])
        @data = data
        super()
      end

      def template
        tbody(class: "table-data") do
          @data.each do |row|
            tr(class: "table-data-row") do
              row.each do |value|
                td(class: "table-data-cell") { value }
              end
            end
          end
        end
      end
    end
  end
end
