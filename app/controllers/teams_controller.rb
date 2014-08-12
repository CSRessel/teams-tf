class TeamsController < ApplicationController
  before_filter :require_sign_in, only:[:new, :create, :show, :edit, :update, :destroy]
  before_filter :require_ownership, only:[:destroy]

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.user_id = current_user.id
    if @team.save
      flash[:success] = 'Team listing created'
      redirect_to teams_path
    else
      render 'new'
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(team_params)
      flash[:success] = 'Team listing updated'
      redirect_to @team
    else
      render 'edit'
    end
  end

  def index
    # TODO: use ransack for searching
    #@search = Players.search(params[:q])
    #@players = @search.result(distinct: true).paginate(:page => params[:page], :per_page => 15)

    @teams = Team.all
  end

  def destroy
    @team = Team.find(params[:id])
    if @team.destroy
      flash[:success] = 'Team listing deleted'
      redirect_to teams_path
    else
      flash[:error] = 'Unable to delete team listing'
      redirect_to team_path(@team)
    end
  end

  private

    def team_params
      params.require(:team).permit(:name, :tag, :game_type, :league_level, :location, :notes, :scout, :soldier, :pyro, :demoman, :heavy, :engineer, :medic, :sniper, :spy)
    end

    def require_sign_in
      if !signed_in?
        store_location
        flash[:error] = 'Sign in required'
        redirect_to denied_path
      end
    end

    def require_ownership
      if current_user.id != Team.find(params[:id]).user_id
        flash[:error] = 'You cannot modify this'
        redirect_to team_path(Team.find(params[:id]))
      end
    end
end
