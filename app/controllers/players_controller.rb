class PlayersController < ApplicationController
  before_filter :require_sign_in, only:[:new, :create, :destroy]
  before_filter :require_ownership, only:[:destroy]

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    @player.user_id = current_user.id
    if @player.save
      flash[:success] = 'Player advertisement created'
      redirect_to players_path
    else
      render 'new'
    end
  end

  def index
    # TODO: use ransack for searching
    #@search = Players.search(params[:q])
    #@players = @search.result(distinct: true).paginate(:page => params[:page], :per_page => 15)

    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
    @reviews = Review.where(player_id: params[:id])
  end

  def destroy
    Player.find(params[:id]).destroy
    flash[:success] = 'Player advertisement deleted'
    redirect_to players_path
  end

  private

    def player_params
      params.require(:player).permit(:game_type, :league, :level, :notes, :scout, :soldier, :pyro, :demoman, :heavy, :engineer, :medic, :sniper, :spy)
    end

    def require_sign_in
      if !signed_in?
        redirect_to root_path
      end
    end

    def require_ownership
      if current_user.id != Player.find(params[:id]).user_id
        redirect_to root_path
      end
    end
end
