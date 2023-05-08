require "rails_helper"

RSpec.describe Image do
  describe "#attributes" do
    it "returns the Image attributes" do
      files = ArticleFile.new({medium: "url_to_image"})
      params = {
        files: files
      }

      image = Image.new(params)

      expect(image).to have_attributes(
        files: files
      )
    end
  end
end
