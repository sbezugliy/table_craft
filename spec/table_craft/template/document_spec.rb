# frozen_string_literal: true

require "spec_helper"

RSpec.describe(TableCraft::Template::Document) do
  subject(:template) { described_class.new }

  let(:template_params) do
    {
      title: "Test Table",
      styles: " table: {  border: 2px solid black; } ",
      body: "text",
    }
  end

  let(:html) do
    template.call { |t| template_params[t] }
  end

  let(:result) do
    [
      "<!DOCTYPE html><html><head><title>Test Table</title>",
      "<style> table: {  border: 2px solid black; } </style></head>",
      "<body>text</body></html>",
    ].join
  end

  it do
    expect(html).to(eq(result))
  end
end
