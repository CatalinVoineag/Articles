require "rails_helper"

RSpec.describe "Articles", type: :request do
  describe "GET /index" do
    it "returns http success" do
      allow_any_instance_of(ArticleService).to receive(:get).and_return({})
      get root_path

      expect(response).to have_http_status(:success)
    end
  end
end
