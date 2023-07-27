# frozen_string_literal: true

require "spec_helper"

RSpec.describe(TableCraft::Template::Document) do
  include Phlex::Testing::Nokogiri::DocumentHelper
  subject(:template) { described_class.new(body) { |t| template_params[t] } }

  let(:body) do
    TestBodyComponent.new("Test body")
  end

  let(:template_params) do
    {
      title: "Test Table",
      styles: "\ntable: {  \n  border: 2px solid black; \n}",
      body: "text",
    }
  end

  let(:output) do
    render template
  end

  it "contains title tag with page name" do
    expect(output.css("title").text).to(eq("Test Table"))
  end

  it "contains style tag with CSS" do
    expect(output.css("style").text).to(eq("\ntable: {  \n  border: 2px solid black; \n}"))
  end

  it "contains body component content" do
    expect(output.css("div.test-section").text).to(eq("Test body"))
  end
end
