# frozen_string_literal: true

require "spec_helper"

RSpec.describe(TableCraft::Styles) do
  subject(:stylesheet) { described_class.new(File.join(__dir__, path)) }

  let(:path) { "../input/styles.css" }

  it { expect(stylesheet.validation.validity).to(be_truthy) }

  context "when styles are invalid" do
    let(:path) { "../input/styles_invalid.css" }

    it { expect { stylesheet }.to(raise_error(RuntimeError)) }
  end
end
