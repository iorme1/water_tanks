class TankLocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    @tank_locations = TankLocation.all
  end

  def new
    @tank_location = current_user.tank_locations.build

  end

  def create
    @tank_location = current_user.tank_locations.build(tank_location_params)
    if @tank_location.save
      redirect_to @tank_location
    else
      @tank_location.errors.full_messages
      render "new"
    end
  end

  def edit

  end

  def update
    if @tank_location.update(tank_location_params)
      redirect_to @tank_location
    else
      @tank_location.errors.full_messages
      render "new"
    end
  end

  def show
    @tank_location = TankLocation.find(params[:id])
  end

  def destroy
  end


  private

    def set_location
      @tank_location = TankLocation.find(params[:id])
    end

    def tank_location_params
      params.require(:tank_location).permit(:address, :latitude, :longitude)
    end
end
