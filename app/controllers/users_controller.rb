class UsersController < ApplicationController
  before_filter :require_sign_in, only:[:show, :edit, :update, :destroy]
  before_filter :require_ownership, only:[:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    if current_user == @user
      @owner = true
      @players = @user.players
      @teams = @user.teams
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'profile updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    log_off
    @user.destroy
    flash[:success] = 'profile deleted'
    redirect_to goodbye_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :tag, :game_type, :league_level, :location, :notes, :scout, :soldier, :pyro, :demoman, :heavy, :engineer, :medic, :sniper, :spy)
    end

    def require_sign_in
      if !signed_in?
        store_location
        redirect_to denied_path
      end
    end

    def require_ownership
      if current_user != User.find(params[:id])
        flash[:error] = 'You cannot modify this'
        redirect_to user_path(User.find(params[:id]))
      end
    end
end
