require "rails_helper"

RSpec.describe Api::GetRequest do
  describe "#response" do
    it "returns response of request" do
      url = "https://fake_path.co.uk"
      body = { success: true }.to_json

      stub_request(:get, url).to_return(
        status: 200,
        body: body
      )
      response = Api::GetRequest.new(url: url).response

      expect(response).to eq(body)
    end
  end
end
