# frozen_string_literal: true

class Api::V1::LocationsController < Api::V1::BaseController
  before_action :set_location, only: %i[show destroy]

  def index
    if params[:start_date].present? && params[:end_date].present?
      @locations = current_user.locations.between_times(Time.parse(params[:start_date]),
                                                        Time.parse(params[:end_date]))
    elsif params[:start_date].present?
      @location = current_user.locations.after(Time.parse(params[:start_date]))
    elsif params[:end_date].present?
      @locations = current_user.locations.before(Time.parse(params[:end_date]))
    else
      @locations = current_user.locations.all
    end

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
