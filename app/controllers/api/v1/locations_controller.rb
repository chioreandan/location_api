# frozen_string_literal: true

class Api::V1::LocationsController < Api::V1::BaseController
  before_action :set_location, only: %i[show destroy]

  def index
    @locations = current_user.locations.all
    render json: @locations
  end

  def create
    @location = Location.new(location_params)
    @location.user_id = current_user.id
    if @location.save!
      render json: @location
    else
      render json: @location.errors
    end
  end

  def show
    render json: @location
  end

  def destroy
    @location.destroy
    render json: 'Location deleted'
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:latitude, :longitude)
  end
end