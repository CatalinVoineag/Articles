class ArticleService
  URL = "https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles-v4.json".freeze

  def get
    parsed_response.map do |element|
      like = Like.find_by(used_by: "Article", used_by_id: element.fetch("id"))

      if like
        element.merge!(likes: like.counter)
      end

      Article.new(element)
    end
  end

  private

  def parsed_response
    @parsed_response ||= JSON.parse(
      Api::GetRequest.new(url: URL).response
    )
  end
end
