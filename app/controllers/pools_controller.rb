class PoolsController < ApplicationController
  before_action :set_pool, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @pools = Pool.where("location ILIKE ?", "%#{params[:query]}%")
    else
      @pools = Pool.all
    end
    @pools = Pool.geocoded # returns flats with coordinates

    @markers = @pools.map do |pool|
      {
        lat: pool.latitude,
        lng: pool.longitude
      }
   
  end

  def show
    @markers = [
      {
        lat: @pool.latitude,
        lng: @pool.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { pool: @pool }),
        image_url: helpers.asset_url('geo_pool.png')
      }
    ]
     @booking = Booking.new
  end

  def new
    @pool = Pool.new
  end

  def create
    @pool = Pool.new(pool_params)
    @pool.user = current_user
    if @pool.save
      redirect_to pool_path(@pool), notice: "Creating your pool"
    else
      render :new
    end
  end

  private

  def set_pool
    @pool = Pool.find(params[:id])
  end

  def pool_params
    params.require(:pool).permit(:name, :location, :description, :capacity, :price, :has_lifeguard, :children_friendly, :jacuzzi_section, :climatization, :pool_side, :has_floats, :towels_include, :pet_friendly, :salted_water, :includes_bar, photos: [])
  end
end
