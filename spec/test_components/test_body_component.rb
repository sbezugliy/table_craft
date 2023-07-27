# frozen_string_literal: true

class TestBodyComponent < Phlex::HTML
  def initialize(text)
    @text = text
    super()
  end

  def template
    div(class: "test-section") do
      @text
    end
  end
end
