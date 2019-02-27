class FleetsController < ApplicationController
  include ApplicationHelper
  before_action :set_user, only: [:new, :create, :show, :destroy]

  def index
    @fleets = Fleet.all
  end

  def show
    @fleet = Fleet.find(params[:id])
  end

  def new
    if params[:league_id] && !League.exists?(params[:league_id])
      redirect_to leagues_path
    else
      binding.pry
      @fleet = Fleet.new(league_id: params[:league_id])
    end
  end

  def create
    @fleet = Fleet.new(fleet_params)
    @user.fleets << @fleet
    binding.pry
      if @fleet.save
        flash[:notice] = "Fleet Created"
        redirect_to fleet_path(@fleet)
      else
        render :new
      end
  end

  def destroy
  end

  def edit
  end

  private

  def fleet_params
    binding.pry
    params.require(:fleet).permit(:name, :league_id)
  end
end
