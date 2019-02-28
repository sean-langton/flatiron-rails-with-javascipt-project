class VoyagesController < ApplicationController
  include ApplicationHelper, ShipsHelper, VoyagesHelper
  before_action :set_user, only: [:new, :create]
  before_action :set_fleet, only: [:new, :create]
  before_action :voyage_set_ship, only: [:new, :create]

  def new
    @voyage = Voyage.new
  end

  def create
  end
end
