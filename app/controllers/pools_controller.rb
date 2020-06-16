class PoolsController < ApplicationController

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

  def pool_params
  params.require(:pool).permit(:name, :description, :capacity, :price, :has_lifeguard, :children_friendly, :jacuzzi_section, :climatization, :pool_side, :has_floats, :towels_include, :pet_friendly, :salted_water, :includes_bar)
  end
end

