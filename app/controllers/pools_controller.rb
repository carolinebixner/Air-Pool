class PoolsController < ApplicationController
    before_action :set_pool, only: [:show, :edit, :update, :destroy]

    def index
        @pools = Pool.all
    end

    def show
    end
  
    def new
    @pool = Pool.new
  end

  def create
    @pool = Pool.new(pool_params)
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
  params.require(:pool).permit(:name, :description, :capacity, :price, :has_lifeguard, :children_friendly, :jacuzzi_section, :climatization, :pool_side, :has_floats, :towels_include, :pet_friendly, :salted_water, :includes_bar)
  end
end
