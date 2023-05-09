require "rails_helper"

RSpec.describe "Likes", type: :request do
  describe "POST /create" do
    it "returns http success" do
      like = create(:like)

      post article_like_path(like.used_by_id)

      expect(response).to have_http_status(:redirect)
    end
  end
end
