require "rails_helper"

describe GsmArena::Client do
  let(:service) { described_class.new(query) }

  describe "#show" do
    let(:query) { "xiaomi_mi_5-6948" }

    subject do
      VCR.use_cassette("gsm_arena/show") do
        service.show
      end
    end

    it { is_expected.to include("Xiaomi Mi 5") }
    it { is_expected.to include("Released 2016, April") }
  end

  describe "#search" do
    let(:query) { "xiaomi" }

    subject do
      VCR.use_cassette("gsm_arena/search") do
        service.search
      end
    end

    it { is_expected.to include("Your search returned <b>37</b> results.") }
  end
end
