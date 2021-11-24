class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :index, :show]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params[:booking])
    if @booking.save
      flash[:success] = "Object successfully created"
      redirect_to @booking
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
end
