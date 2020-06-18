class PagesController < ApplicationController
  def home
    @pools = Pool.all
    @pools_sample = @pools.sample(9)
  end

  def dashboard

  end
end
