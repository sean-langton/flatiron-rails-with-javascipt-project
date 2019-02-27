class LeaguesController < ApplicationController
  def index
    @leagues = League.all
  end

  def show
    @league = params[:id]
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
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
