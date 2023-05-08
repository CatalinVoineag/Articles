class Image < Dry::Struct
  transform_keys(&:to_sym)

  attribute :files, ArticleFile
end
