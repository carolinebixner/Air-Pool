class PoolsController < ApplicationController
    before_action :set_pool, only: [:show, :edit, :update, :destroy]

    def index
        @pools = Pool.all
    end

    def show
    end

private

    def set_pool
        @pool = Pool.find(params[:id])
    end

    def pool_params
        params.require(:pool).permit(:name, :description, :capacity, :price, :has_lifeguard, :children_friendly, :jacuzzi_section, :climatization, :pool_slide, :has_floats, :towels_included, :pet_friendly, :salted_water, :includes_bar)
    end

end