require "rails_helper"

describe V1::Search::ProductsController, type: :request do
  describe "#GET index" do
    before do
      VCR.use_cassette("gsm_arena/search") do
        get v1_search_products_url(query: query)
      end
    end

    subject { response.status }

    context "when query is present" do
      let(:query) { "xiaomi" }

      it { is_expected.to eq 200 }
      it { expect(json_response_body.size).to eq 38 }
    end

    context "when query is blank" do
      let(:query) { "" }

      it { is_expected.to eq 200 }
      it { expect(json_response_body.size).to eq 0 }
    end
  end
end
