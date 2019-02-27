class LeaguesController < ApplicationController
  include ApplicationHelper
  before_action :set_user, only: [:new, :create]

  def index
    @leagues = League.all
  end

  def show
    @league = League.find(params[:id])
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    @league.admin_id = @user.id
    binding.pry
      if @league.save
        flash[:notice] = "League Created "
        redirect_to league_path(@league)
      else
        render :new
      end
  end

  def destroy
  end

  private

  def league_params
    params.require(:league).permit(:name, :num_of_fleets)
  end
end
