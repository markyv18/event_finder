class Api::V1::VenuesController < ApplicationController

  def index
    render json: Venue.all
  end

  def show
    render json: Venue.find(params[:id])
  end

  def destroy
    Venue.delete(params[:id])
  end

  def create
    render json: Venue.create(strong_params)
  end

  private

def strong_params
  params.permit(:name, :address, :url, :latitude, :longitude)
end

end
