class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
    end

  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.find(params[:id])
    booking.user_id = current_user.id
    if @booking.save
      redirect_to booking_path(@booking), notice: "You have booked your pool!"
    else
      render :new
    end
  end

  def update
      if @booking.update(booking_params)
      redirect_to @booking, notice: 'Your booking was succesfully updated.'
    else
      render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:id)
  end

end
