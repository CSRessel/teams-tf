class TeamsController < ApplicationController
  before_filter :require_sign_in, only:[:new, :create, :destroy]
  before_filter :require_ownership, only:[:destroy]

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.user_id = current_user.id
    if @team.save
      flash[:success] = 'Team advertisement created'
      redirect_to teams_path
    else
      render 'new'
    end
  end

  def index
    # TODO: use ransack for searching
    #@search = Players.search(params[:q])
    #@players = @search.result(distinct: true).paginate(:page => params[:page], :per_page => 15)

    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def destroy
    Team.find(params[:id]).destroy
    redirect_to teams_path
  end

  private

    def team_params
      params.require(:team).permit(:name, :tag, :game_type, :league, :level, :notes, :scout, :soldier, :pyro, :demoman, :heavy, :engineer, :medic, :sniper, :spy)
    end

    def require_sign_in
      if !signed_in?
        redirect_to root_path
      end
    end

    def require_ownership
      if current_user.id != Team.find(params[:id]).user_id
        redirect_to root_path
      end
    end
end
