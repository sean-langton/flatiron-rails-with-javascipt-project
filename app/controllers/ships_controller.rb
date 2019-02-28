class ShipsController < ApplicationController
  include ApplicationHelper
  before_action :set_user, only: [:new, :create, :show, :destroy, :edit]

  def index
    if params[:fleet_id] && Fleet.exists?(params[:fleet_id])
    @fleet = Fleet.find(params[:fleet_id])
    end
    @ships = Ship.all
  end

  def show
  end

  def edit
    fleet = Fleet.find_by(id: params[:fleet_id])
    ship = Ship.find_by(id: params[:id])
    binding.pry
    if fleet && ship && @user.fleets.include?(fleet)
      fleet.ships << ship
      redirect_to fleet_path(fleet)
    else
      redirect_to user_path(@user)
    end
  end

  def update
  end

  def new
    if params[:fleet_id] && Fleet.exists?(params[:fleet_id])
      @fleet =Fleet.find(params[:fleet_id])
      @ship = Ship.new(fleet_id: params[:fleet_id])
    else
      @ship = Ship.new
    end
  end

  def create
    @ship = Ship.new(ship_params)
      if @ship.save
        flash[:notice] = "Ship Created"
        redirect_to ship_path(@ship)
      else
        render :new
      end
  end

  private

  def ship_params
    params.require(:ship).permit(:name, :size, :max_cargo, :max_distance)
  end
end
