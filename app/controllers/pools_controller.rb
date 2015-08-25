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
    @pool = Pool.find_by(passcode: params[:passcode])
    if @pool
      redirect_to pool_path(@pool)
    else
      render :index
    end
  end

  def show
    @pool = Pool.find(params[:id])
    @user = User.new

    @users = User.where(pool_id: params[:id])
  end

  private

  def pool_params
    params.require(:pool).permit(
      :passcode
    )
  end
end
