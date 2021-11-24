class HotelsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :index, :show]
  before_action :set_hotel, only: [:show]

  def index
    if params[:query].present?
      @hotels = Hotel.search_by_city(params[:query])
    else
      @hotels = policy_scope(Hotel).order(created_at: :desc)
    end

    @markers = @hotels.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      flash[:success] = "Object successfully created"
      redirect_to @hotel
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end


  private

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end

  def hotel_params
    params.require(:hotel).permit(:name, :address, :brand, photos: [])
  end

end
