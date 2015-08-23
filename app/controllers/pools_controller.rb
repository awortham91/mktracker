class PoolsController < ApplicationController
  def index
  end

  def new
    @pool = Pool.new
  end

  def create
    @pool = Pool.new(pool_params)

    if @pool.save
      redirect_to pool_path(@pool)
    end
  end

  def start
    redirect_to "http://google.com"
  end

  def show
  end

  private

  def pool_params
    params.require(:pool).permit(
      :passcode
    )
  end
end
