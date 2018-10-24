class Api::V1::LocationsController < Api::V1::BaseController
  before_action :set_location, only: [:show, :delete]

  def index
    @locations = Location.all
    render json: @locations
  end

  def create
    location = Location.new(location_params)
    location.save!

    render json: location
  end

  def show
    render json: @location
  end

  def delete
    @location.destroy
    render josn: @location
  end

  private

    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:latitude, :longitude)
    end
end
