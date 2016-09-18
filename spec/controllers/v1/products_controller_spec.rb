require "rails_helper"

describe V1::ProductsController, type: :request do
  describe "#GET show" do
    let(:product_id) { "xiaomi_mi_5-6948" }

    subject do
      VCR.use_cassette("gsm_arena/show") do
        get v1_product_url(id: product_id)
      end
    end

    it { is_expected.to eq 200 }
  end
end
