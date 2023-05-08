require "rails_helper"

RSpec.describe ArticleFile do
  describe "#attributes" do
    it "returns the article file attributes" do
      params = {
        medium: "url_to_image"
      }

      file = ArticleFile.new(params)

      expect(file).to have_attributes(
        medium: "url_to_image"
      )
    end
  end
end
