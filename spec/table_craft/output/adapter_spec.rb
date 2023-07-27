# frozen_string_literal: true

require "spec_helper"

RSpec.describe(TableCraft::Output::Adapter) do
  subject(:data_source) { described_class.new(type, data, formatted) }

  let(:path) { File.join(__dir__, "../../output/page.html") }

  let(:type) { "print" }
  let(:formatted) { false }

  let(:data) do
    %(<html>
  <head>
    <title>Page title</title>
  </head>
  <body>
    <div>Page body</div>
  </body>
</html>)
  end

  context "when type is print and unformatted" do
    let(:path) { nil }

    it { expect { data_source.data.output }.to(output.to_stdout) }
  end

  context "when type is print and formatted" do
    let(:path) { nil }
    let(:formatted) { true }

    it { expect { data_source.data.output }.to(output.to_stdout) }
  end

  context "when type is file" do
    let(:type) { "file" }

    # rubocop:disable RSpec/BeforeAfterAll
    before :context do
      FileUtils.rm_f(File.join(__dir__, "../../output/page.html"))
    end
    # rubocop:enable RSpec/BeforeAfterAll

    it { expect(data_source.data.output(path)).to(eq(107)) }
    it { expect(File.read(path)).to(eq(data)) }
  end
end
