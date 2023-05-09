class Article < Dry::Struct
  transform_keys(&:to_sym)

  attribute :title, Types::String
  attribute :id, Types::Integer
  attribute :likes, Types::Integer.default(0)
  attribute :images, Types::Array.of(Image)

  def small_image
    images.first.files.small
  end
end
