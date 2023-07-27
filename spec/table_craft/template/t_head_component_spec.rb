# frozen_string_literal: true

require "spec_helper"

RSpec.describe(TableCraft::Template::THeadComponent) do
  subject(:template) { described_class.new(headers) }

  let(:headers) do
    ["#", "Name", "Value"]
  end

  let(:result) do
    [
      "<thead class=\"table-head\"><tr class=\"table-head-row\">",
      "<th class=\"table-head-cell\">#</th><th class=\"table-head-cell\">Name</th>",
      "<th class=\"table-head-cell\">Value</th>",
      "</tr></thead>",
    ].join
  end

  let(:html) do
    template.call
  end

  it do
    expect(html).to(eq(result))
  end
end
