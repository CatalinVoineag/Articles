Rails.application.routes.draw do
  root "articles#index"
  post "like/:article_id", to: "likes#create", as: :article_like
end
