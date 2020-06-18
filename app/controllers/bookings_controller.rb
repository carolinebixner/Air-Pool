class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pool_id = params[:pool_id]
    @booking.user_id = current_user.id
    if @booking.save
      redirect_to dashboard_path, notice: "You have booked your pool!"
    else
      @pool = Pool.find(params[:pool_id])
      @markers = [
      {
          lat: @pool.latitude,
          lng: @pool.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { pool: @pool }),
          image_url: helpers.asset_url('geo_pool.png')
        }
      ]
     @booking = Booking.new
      render "pools/show"
    end
  end

  def booking_accepted(booking)
    booking.status = 'accepted'
  end

  def booking_rejected(booking)
    booking.status = 'rejected'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
