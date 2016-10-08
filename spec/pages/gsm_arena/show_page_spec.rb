require "rails_helper"

describe GsmArena::ShowPage do
  let(:service) { described_class.new(html) }

  describe "#call" do
    let(:html) do
      VCR.use_cassette("gsm_arena/show") do
        GsmArenaClient.new("xiaomi_mi_5-6948").show
      end
    end
    let(:brief) do
      "Released 2016, April 129g / 139g, "\
      "7.3mm thickness Android OS, "\
      "v6.0 128GB storage, no card slot"
    end
    let(:product) do
      {
        battery: "3000mAhLi-Po",
        brief: brief,
        camera:  "16MP 2160p",
        display: "5.15\"1080x1920 pixels",
        expansion: "4GB RAM Snapdragon 820",
        image: "http://cdn2.gsmarena.com/vv/bigpic/xiaomi-mi-5.jpg",
        title: "Xiaomi Mi 5"
      }
    end

    subject { service.call }

    it { is_expected.to eq product }
  end
end
