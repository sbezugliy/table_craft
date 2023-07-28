# frozen_string_literal: true

require "spec_helper"

RSpec.describe(TableCraft::Dsl) do
  subject(:table) do
    TableCraft::Table.new.tap do |obj|
      obj.source = ["csv", File.join(__dir__, "../../input/data.csv")]
      obj.title = ["Import from CSV to Shell"]
      obj.width = ["100px"]
      obj.height = ["100px"]
      obj.border = ["2"]
      obj.cellpadding = ["10"]
      obj.header = [["#", "Column 1", "Column 2", "Column 3", "Column 4", "Column 5"]]
      obj.styles = [File.join(__dir__, "../../input/styles_1.css")]
      obj.formatted([true])
    end
  end

  before do
    stub_table = Class.new(TableCraft::Table) do
      def output=(*args)
        self
      end
    end
    stub_const("::TableCraft::Table", stub_table)
  end

  describe "evaluated methods and relevant attributes of the object" do
    let!(:table_object) { table.public_send(:output=, "test") }

    context "when called stubbed output finishing method" do
      it { expect(table_object).to(be_a(TableCraft::Table)) }

      it {
        expect(table_object.send(:build_document))
          .to(match(%r{\<\!DOCTYPE html\>\<html\>.*(\s|\n|\t|\r|.)*.*\</html\>}))
      }
    end

    (TableCraft::ATTRIBUTES - [:output]).each do |attr|
      context "when called #{attr}" do
        it { expect(table_object.methods).to(include("#{attr}=".to_sym)) }
        it { expect(table_object.instance_variables).to(include("@#{attr}".to_sym)) }
      end
    end
  end
end
