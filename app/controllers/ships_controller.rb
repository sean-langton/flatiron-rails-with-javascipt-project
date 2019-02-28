class ShipsController < ApplicationController
  include ApplicationHelper
  before_action :set_user, only: [:new, :create, :show, :destroy]

  def index
  end

  def show
  end

  def edit
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
  end
end
