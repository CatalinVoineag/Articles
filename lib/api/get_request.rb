require 'net/http'

module Api
  class GetRequest
    ApiError = Class.new(StandardError)

    attr_reader :url
    private :url

    def initialize(url:)
      @url = url
    end

    def response
      if request.is_a?(Net::HTTPOK)
        request.body
      else
        raise ApiError, "Response: #{request.body}"
      end
    end

    private

    def request
      uri = URI(url)

      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true

      request = Net::HTTP::Get.new(uri)

      https.request(request)
    end
  end
end
