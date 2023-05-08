require "rails_helper"

RSpec.describe Article do
  describe "#attributes" do
    it "returns the article attributes" do
      files = ArticleFile.new({medium: "url_to_image"})
      images = [
        Image.new(
          {
            files: files
          }
        )
      ]
      params = {
        title: "title",
        images: images
      }

      article = Article.new(params)

      expect(article).to have_attributes(
        title: "title",
        images: images
      )
    end
  end

  describe "#medium_image" do
    it "returns the medium image of an article" do
      files = ArticleFile.new({medium: "url_to_image"})
      images = [
        Image.new(
          {
            files: files
          }
        )
      ]
      params = {
        title: "title",
        images: images
      }

      article = Article.new(params)

      expect(article.medium_image).to eq("url_to_image")
    end
  end
end
