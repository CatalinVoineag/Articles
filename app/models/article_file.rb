class ArticleFile < Dry::Struct
  transform_keys(&:to_sym)

  attribute :small, Types::String
end
