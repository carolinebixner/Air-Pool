class PagesController < ApplicationController
  def home
    @pools = Pool.all
    @pools_sample = @pools.sample(9)
  end

  def dashboard
    @my_bookings = current_user.bookings
    @my_pools = current_user.pools

    @my_booking_requests = Booking.all.select do |booking|
    booking.pool.user == current_user
    end
  end
end
