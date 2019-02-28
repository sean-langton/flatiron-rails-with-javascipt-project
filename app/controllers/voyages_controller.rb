class VoyagesController < ApplicationController
  include ApplicationHelper, ShipsHelper, VoyagesHelper
  before_action :set_user, only: [:new, :create]
  before_action :set_fleet, only: [:new, :create]
  before_action :voyage_set_ship, only: [:new, :create]

  def new
    @voyage = Voyage.new(ship_id: params[:ship_id], fleet_id: params[:fleet_id])
  end

  def create
    @voyage = Voyage.new(voyage_params)
    binding.pry
      if @voyage.save
        flash[:notice] = "Voyage Created"
        redirect_to fleet_path(@voyage.fleet)
      else
        render :new
      end
  end

  def most_recent
    @voyages = Voyage.most_recent
  end

  private

  def voyage_params
    params.require(:voyage).permit(:dep_port, :arr_port, :cargo, :distance, :ship_id, :fleet_id)
  end

end
