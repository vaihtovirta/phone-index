require "rails_helper"

describe SourceManager do
  let(:service_call) { described_class.call(source, query, page) }

  describe "#call" do
    let(:client) { double(:client) }
    let(:page) { "show"}
    let(:query) { "iphone 7" }
    let(:source) { "gsm_arena" }

    before do
      allow(GsmArena::Client).to receive(:new).with(query).and_return(client)
      allow(client).to receive(:send).with(page)
    end

    it do
      expect(GsmArena::ShowPage).to receive(:call)
      service_call
    end
  end
end
