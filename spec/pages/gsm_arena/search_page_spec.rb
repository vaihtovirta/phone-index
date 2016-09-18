require "rails_helper"

describe GsmArena::SearchPage do
  let(:service) { described_class.new(html) }

  describe "#call" do
    let(:html) do
      VCR.use_cassette("gsm_arena/search") do
        GsmArena::Client.new("xiaomi").search
      end
    end

    let(:description) do
      "Xiaomi Redmi Note 3 Android smartphone. "\
      "Announced 2016, January. "\
      "Features 3G, 5.5″ IPS LCD capacitive touchscreen, "\
      "16 MP camera, Wi-Fi, GPS, Bluetooth."
    end
    let(:product) do
      {
        description: description,
        id: "xiaomi_redmi_note_3-7863",
        image_url: "http://cdn2.gsmarena.com/vv/bigpic/xiaomi-redmi-note-3.jpg",
        source: "gsm_arena",
        title: "Xiaomi Redmi Note 3"
      }
    end

    subject(:result) { service.call }

    it { expect(result.size).to eq 37 }
    it { expect(result).to include(product) }
  end
end
