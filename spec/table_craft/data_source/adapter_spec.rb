# frozen_string_literal: true

require "spec_helper"

RSpec.describe(TableCraft::DataSource::Adapter) do
  subject(:data_source) { described_class.new(type, source_file) }

  let(:type) { "csv" }
  let(:source_file) { File.join(__dir__, "../../input/data.csv") }

  let(:result) do
    [
      ["1", "$B$2", "$C$2", "$D$2", "$E$2", "$F$2"],
      ["2", "$B$3", "$C$3", "$D$3", "$E$3", "$F$3"],
      ["3", "$B$4", "$C$4", "$D$4", "$E$4", "$F$4"],
      ["4", "$B$5", "$C$5", "$D$5", "$E$5", "$F$5"],
      ["5", "$B$6", "$C$6", "$D$6", "$E$6", "$F$6"],
      ["6", "$B$7", "$C$7", "$D$7", "$E$7", "$F$7"],
      ["7", "$B$8", "$C$8", "$D$8", "$E$8", "$F$8"],
      ["8", "$B$9", "$C$9", "$D$9", "$E$9", "$F$9"],
      ["9", "$B$10", "$C$10", "$D$10", "$E$10", "$F$10"],
      ["10", "$B$11", "$C$11", "$D$11", "$E$11", "$F$11"],
    ]
  end

  context "when file is csv" do
    it { expect(data_source.data).to(eq(result)) }
  end

  context "when file is tsv" do
    let(:type) { "tsv" }
    let(:source_file) { File.join(__dir__, "../../input/data.tsv") }

    it { expect(data_source.data).to(eq(result)) }
  end
end
