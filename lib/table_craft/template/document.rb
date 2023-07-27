# frozen_string_literal: true

module TableCraft
  module Template
    class Document < ::Phlex::HTML
      def initialize(body_component)
        @body_component = body_component
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
            render(@body_component)
          end
        end
      end
    end
  end
end
