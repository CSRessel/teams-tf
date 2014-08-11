class ReviewsController < ApplicationController
  before_filter :require_sign_in, only:[:create, :destroy]
  before_filter :require_ownership, only:[:destroy]

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:success] = 'Review posted'
      redirect_to player_path(Player.find(@review.player_id))
    else
      flash[:error] = 'Unable to post review'
      redirect_to player_path(Player.find(@review.player_id))
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @player = Player.find(@review.player_id)
    if @review.destroy
      flash[:success] = 'Review deleted'
      redirect_to player_path(@player)
    else
      flash[:error] = 'Unable to delete review'
      redirect_to player_path(@player)
    end
  end

  private

    def review_params
      params.require(:review).permit(:body)
    end

    def require_sign_in
      if !signed_in?
        redirect_to root_path
      end
    end

    def require_ownership
      if current_user.id != Review.find(params[:id]).user_id
        redirect_to root_path
      end
    end
end
