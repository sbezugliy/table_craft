# frozen_string_literal: true

module TableCraft
  module Template
    class THeadComponent < ::Phlex::HTML
      def initialize(headers = [])
        @headers = headers
        super()
      end

      def template
        thead(class: "table-head") do
          tr(class: "table-head-row") do
            @headers.each do |header|
              th(class: "table-head-cell") { header }
            end
          end
        end
      end
    end
  end
end
