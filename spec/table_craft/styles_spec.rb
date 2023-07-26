# frozen_string_literal: true

require "spec_helper"

RSpec.describe(TableCraft::Styles) do
  subject(:stylesheet) { described_class.new(selector, properties) }

  let(:selector) { ".styled-table" }
  let(:properties) do
    {
      "background-color": "red",
      "background-image": "linear-gradient(to right, #ff0000, #aa0000)",
    }
  end

  context "when css is invalid" do
    let(:properties) do
      {
        "background-color": "adasdared",
        "background-image": "linear-  gradient(to right, #ff0000, #aa0000)",
      }
    end

    it "returns css" do
      expect { stylesheet.css }.to(raise_error(RuntimeError))
    end
  end

  context "when selector is empty" do
    let(:selector) { "" }

    it "raises ArgumentError" do
      expect { stylesheet }.to(raise_error(
        ArgumentError,
        "Stylesheet selector should be given.",
      ))
    end
  end

  context "when properties are empty" do
    let(:properties) { {} }

    it "raises ArgumentError" do
      expect { stylesheet }.to(raise_error(
        ArgumentError,
        "Stylesheet properties should not be empty.",
      ))
    end
  end

  context "when simple stylesheet" do
    let(:css) do
      %(.styled-table {
    background-color: red;
    background-image: linear-gradient(to right, #ff0000, #aa0000);
})
    end

    it "returns css" do
      expect(stylesheet.css).to(eq(css))
    end
  end

  context "when complex selector" do
    let(:selector) { ".selectize-input>div.ui-sortable-placeholder" }
    let(:properties) do
      {
        "visibility": "visible !important",
        "background": "rgba(0,0,0,0.06) !important",
        "border": "0 none !important",
        "box-shadow": "inset 0 0 12px 4px #fff",
      }
    end
    let(:css) do
      %(.selectize-input>div.ui-sortable-placeholder {
    visibility: visible !important;
    background: rgba(0,0,0,0.06) !important;
    border: 0 none !important;
    box-shadow: inset 0 0 12px 4px #fff;
})
    end

    it "returns css" do
      expect(stylesheet.css).to(eq(css))
    end
  end
end
