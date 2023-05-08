class ArticleFile < Dry::Struct
  transform_keys(&:to_sym)

  attribute :medium, Types::String
end
