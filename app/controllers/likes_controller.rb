class LikesController < ApplicationController
  def create
    like = Like.find_or_create_by(
      used_by: "Article",
      used_by_id: article_id
    )

    if like.increase_counter!
      respond_to do |format|
        format.turbo_stream {
          render locals: { likes: like.counter, article_id: article_id }
        }
        format.html {
          redirect_to root_path
        }
      end
    else
      redirect_to root_path, alert: "Article could not be liked"
    end
  end

  private

  def article_id
    params.require(:article_id)
  end
end
