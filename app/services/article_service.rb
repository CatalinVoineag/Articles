class ArticleService
  URL = "https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles-v4.json".freeze

  def get
    parsed_response.map do |element|
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
