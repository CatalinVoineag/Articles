FactoryBot.define do
  factory :like do
    used_by { "Article" }
    used_by_id  { 123 }
    counter { 1 }
  end
end
