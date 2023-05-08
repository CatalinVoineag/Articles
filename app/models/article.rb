class Article < Dry::Struct
  transform_keys(&:to_sym)

  attribute :title, Types::String
  attribute :images, Types::Array.of(Image)
  #Types::Params???

  def medium_image
    images.first.files.medium
  end
end
