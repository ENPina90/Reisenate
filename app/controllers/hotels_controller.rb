class HotelsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_hotel, only: [:show]

  def index
    if params[:query].present?
      @hotels = Hotel.search_by_city(params[:query])
    else
      @hotels = policy_scope(Hotel).order(created_at: :desc)
    end
  end

  def show
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end

  def hotel_params
    params.require(:hotel).permit(:name, :city, :address, :brand, :review, :review_url)
  end

end
