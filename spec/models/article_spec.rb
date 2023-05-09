require "rails_helper"

RSpec.describe Article do
  describe "#attributes" do
    it "returns the article attributes" do
      files = ArticleFile.new({ small: "url_to_image" })
      images = [
        Image.new(
          {
            files: files
          }
        )
      ]
      params = {
        title: "title",
        id: 123,
        images: images
      }

      article = Article.new(params)

      expect(article).to have_attributes(
        title: "title",
        images: images
      )
    end
  end

  describe "#small_image" do
    it "returns the medium image of an article" do
      files = ArticleFile.new({ small: "url_to_image" })
      images = [
        Image.new(
          {
            files: files
          }
        )
      ]
      params = {
        title: "title",
        id: 123,
        images: images
      }

      article = Article.new(params)

      expect(article.small_image).to eq("url_to_image")
    end
  end
end
