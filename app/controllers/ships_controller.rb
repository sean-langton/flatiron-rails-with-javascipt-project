class ShipsController < ApplicationController
  include ApplicationHelper, ShipsHelper
  before_action :set_user, only: [:new, :create, :show, :destroy, :edit]
  before_action :set_fleet, only: [:show, :index]
  before_action :set_ship, only: [:show]
  def index
    @ships = Ship.all
  end

  def show
    binding.pry
  end

  def edit
    fleet = find_fleet
    ship = find_ship
    if edit_permission_check
      fleet.ships << ship
      redirect_to fleet_path(fleet)
    else
      redirect_to user_path(@user)
    end
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

  def destroy
    fleet = find_fleet
    ship = find_ship
    if edit_permission_check
      fleet.ships.delete(ship)
      redirect_to fleet_path(fleet)
    else
      redirect_to user_path(@user)
    end
  end

  private

  def ship_params
    params.require(:ship).permit(:name, :size, :max_cargo, :max_distance)
  end

  def edit_permission_check
    find_fleet && find_ship && @user.fleets.include?(find_fleet)
  end


end
