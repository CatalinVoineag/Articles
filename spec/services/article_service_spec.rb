require "rails_helper"

RSpec.describe ArticleService do
  describe "#get" do
    it "returns back Article objects" do
      article_service = ArticleService.new
      response = [{
        title: "title",
        images: []
      }].to_json

      allow_any_instance_of(Api::GetRequest).to receive(:response).and_return(response)

      expect(article_service.get).to all(be_a(Article))
    end
  end
end
