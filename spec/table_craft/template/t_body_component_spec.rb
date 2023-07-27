
require "spec_helper"

RSpec.describe ::TableCraft::Template::TBodyComponent do
  subject(:template) { described_class.new(data) }
  
  let(:data) do
    [
      [ "1", "Name 1", "Value 1" ],
      [ "2", "Name 2", "Value 2" ],
      [ "4", "Name 3", "Value 3" ]
    ]
  end
  
  let(:result) do
    [
      "<tbody class=\"table-data\">",
      "<tr class=\"table-data-row\"><td class=\"table-data-cell\">1</td><td class=\"table-data-cell\">Name 1</td><td class=\"table-data-cell\">Value 1</td></tr>",
      "<tr class=\"table-data-row\"><td class=\"table-data-cell\">2</td><td class=\"table-data-cell\">Name 2</td><td class=\"table-data-cell\">Value 2</td></tr>",
      "<tr class=\"table-data-row\"><td class=\"table-data-cell\">4</td><td class=\"table-data-cell\">Name 3</td><td class=\"table-data-cell\">Value 3</td></tr>",
      "</tbody>"
    ].join
  end
  
  let(:html) do 
    template.call
  end
  
  it do 
    expect(html).to eq(result) 
  end
end