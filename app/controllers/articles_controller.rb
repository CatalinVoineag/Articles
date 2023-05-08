class ArticlesController < ApplicationController
  def index
    @articles = ArticleService.new.get
  end
end
