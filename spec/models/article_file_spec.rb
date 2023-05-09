require "rails_helper"

RSpec.describe ArticleFile do
  describe "#attributes" do
    it "returns the article file attributes" do
      params = {
        small: "url_to_image"
      }

      file = ArticleFile.new(params)

      expect(file).to have_attributes(
        small: "url_to_image"
      )
    end
  end
end
