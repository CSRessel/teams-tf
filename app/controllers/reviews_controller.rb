class ReviewsController < ApplicationController
  before_filter :require_sign_in, only:[:create, :edit, :update, :destroy]
  before_filter :require_ownership, only:[:edit, :update, :destroy]

  def new
    # TODO: assign review.player_id ???
  end

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

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      flash[:success] = 'Review updated'
      redirect_to Player.find(@review.player_id)
    else
      render 'edit'
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
        store_location
        flash[:error] = 'Sign in required'
        redirect_to denied_path
      end
    end

    def require_ownership
      if current_user.id != Review.find(params[:id]).user_id
        flash[:error] = 'You cannot modify this'
        redirect_to player_path(Player.find(Review.find(params[:id]).player_id))
      end
    end
end
