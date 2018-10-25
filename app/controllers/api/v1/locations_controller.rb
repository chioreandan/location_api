class Api::V1::LocationsController < Api::V1::BaseController
  before_action :set_location, only: [:show, :destroy]

  def index
    @locations = Location.all
    render json: @locations
  end

  # def new
  #   @location = Location.new

  #   render json: @location
  # end

  def create
    @location = Location.new(location_params)
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
    render :json => "Location deleted"
  end

  private

    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:latitude, :longitude, :user_id)
    end
end
