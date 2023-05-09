require "rails_helper"

RSpec.describe ArticleService do
  describe "#get" do
    it "returns back Article objects" do
      article_service = ArticleService.new
      response = [{
        title: "title",
        id: 123,
        images: []
      }].to_json

      allow_any_instance_of(Api::GetRequest).to receive(:response).and_return(response)

      expect(article_service.get).to all(be_a(Article))
    end

    context "when a like record is found" do
      it "returns articles with likes" do
        article_service = ArticleService.new
        response = [{
          title: "title",
          id: 123,
          images: []
        }].to_json
        like_record = instance_double(
          Like,
          counter: 12
        )

        allow(Like).to receive(:find_by).and_return(like_record)
        allow_any_instance_of(Api::GetRequest).to receive(:response)
          .and_return(response)

        expect(article_service.get).to all(be_a(Article))
        expect(article_service.get).to include(
          have_attributes(likes: 12)
        )
      end
    end
  end
end
