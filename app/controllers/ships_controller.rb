class ShipsController < ApplicationController
  include ApplicationHelper, ShipsHelper
  before_action :set_user, only: [:new, :create, :show, :destroy, :update]
  before_action :set_fleet, only: [:show, :index, :update]
  before_action :set_ship, only: [:show, :update]
  def index
    @ships = Ship.all
  end

  def show
    if @fleet
      @voyages = Voyage.all.where("fleet_id = ? AND ship_id = ?", @fleet.id, @ship.id).where.not(dep_port: [nil, ""])
    else
      @voyages = Voyage.all.where(ship_id: @ship).where.not(dep_port: [nil, ""])
    end
  end

  def update
    if edit_permission_check
      @fleet.ships << @ship
      redirect_to fleet_path(@fleet)
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
    if edit_permission_check
      @fleet.ships.delete(@ship)
      redirect_to fleet_path(@fleet)
    else
      redirect_to user_path(@user)
    end
  end

  private

  def ship_params
    params.require(:ship).permit(:name, :size, :max_cargo, :max_distance)
  end

  def edit_permission_check
    @fleet && @ship && @user.fleets.include?(@fleet)
  end


end
