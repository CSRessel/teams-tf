class PlayersController < ApplicationController
  before_filter :require_sign_in, only:[:new, :create, :show, :edit, :update, :destroy]
  before_filter :require_ownership, only:[:edit, :update, :destroy]

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    @player.user_id = current_user.id
    if @player.save
      flash[:success] = 'player listing created'
      redirect_to players_path
    else
      render 'new'
    end
  end

  def show
    @player = Player.find(params[:id])
    @reviews = Review.where(player_id: params[:id])
    @review = Review.new
    session[:player_id] = params[:id]
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update_attributes(player_params)
      flash[:success] = 'player listing updated'
      redirect_to @player
    else
      render 'edit'
    end
  end

  def index
    @search = Player.search(params[:q])
    @players = @search.result(distinct: true).paginate(:page => params[:page], :per_page => 15)
    #@players = Player.all
  end

  def search
    index
    render 'index'
  end

  def destroy
    @player = Player.find(params[:id])
    if @player.destroy
      flash[:success] = 'player listing deleted'
      redirect_to players_path
    else
      flash[:error] = 'unable to delete player listing'
      redirect to player_path(@player)
    end
  end

  private

    def player_params
      params.require(:player).permit(:game_type, :league_level, :location, :notes, :scout, :soldier, :pyro, :demoman, :heavy, :engineer, :medic, :sniper, :spy)
    end

    def require_sign_in
      if !signed_in?
        store_location
        redirect_to denied_path
      end
    end

    def require_ownership
      if current_user.id != Player.find(params[:id]).user_id
        flash[:error] = 'you cannot modify this'
        redirect_to player_path(Player.find(params[:id]))
      end
    end
end
