# frozen_string_literal: true

RSpec.describe(TableCraft::Template::TableComponent) do
  include Phlex::Testing::Nokogiri::DocumentHelper
  subject(:template) { described_class.new(headers, data, table_attrs) }

  let(:headers) { ["#", "Column 1", "Column 2", "Column 3"] }
  let(:data) do
    [
      ["1", "Name 1", "Value 1", "Description 1"],
      ["2", "Name 2", "Value 2", "Description 2"],
      ["3", "Name 3", "Value 3", "Description 3"],
    ]
  end

  let(:table_attrs) do
    { width: "200px", height: "200px", cellpadding: 10, border: 3 }
  end

  let(:output) do
    render template
  end

  describe "table" do
    it { expect(output.css("table").attr("width").value).to(eq("200px")) }
    it { expect(output.css("table").attr("height").value).to(eq("200px")) }
    it { expect(output.css("table").attr("cellpadding").value).to(eq("10")) }
    it { expect(output.css("table").attr("border").value).to(eq("3")) }
  end

  describe "thead" do
    it { expect(output.css("table thead").attr("class").value).to(eq("table-head")) }
    it { expect(output.css("table thead tr").attr("class").value).to(eq("table-head-row")) }
    it { expect(output.css("table thead tr th").attr("class").value).to(eq("table-head-cell")) }

    it { expect(output.css("table thead tr").children.count).to(eq(4)) }
    it { expect(output.css("table thead tr").map(&:text)[0]).to(eq(headers.join)) }
  end

  describe "tbody" do
    it { expect(output.css("table tbody").attr("class").value).to(eq("table-data")) }
    it { expect(output.css("table tbody tr").attr("class").value).to(eq("table-data-row")) }
    it { expect(output.css("table tbody tr td").attr("class").value).to(eq("table-data-cell")) }

    it { expect(output.css("table tbody tr").children.count).to(eq(12)) }
    it { expect(output.css("table tbody tr").map(&:text).join).to(eq(data.join)) }
  end
end
