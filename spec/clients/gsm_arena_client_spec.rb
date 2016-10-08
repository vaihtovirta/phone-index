require "rails_helper"

describe GsmArenaClient do
  let(:service) { described_class.new(query) }

  describe "#show" do
    let(:query) { "xiaomi_mi_5-6948" }

    subject do
      VCR.use_cassette("gsm_arena/show") { service.show }
    end

    it { is_expected.to include("Xiaomi Mi 5") }
    it { is_expected.to include("Released 2016, April") }
  end

  describe "#search" do
    let(:query) { "xiaomi" }

    subject do
      VCR.use_cassette("gsm_arena/search") { service.search }
    end

    it { is_expected.to include("Your search returned <b>38</b> results.") }
  end
end
