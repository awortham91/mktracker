class PoolsController < ApplicationController
  def index
  end

  def new
    @pool = Pool.new
  end

  def create
    @pool = Pool.new(pool_params)

    if @pool.save
      redirect_to pool_path(@pool, q: params[:pool][:passcode] )
    end
  end

  def start
    @pool = Pool.find_by(passcode: params[:passcode])
    if @pool
      redirect_to pool_path(@pool, q: params[:passcode])
    else
      render :index
    end
  end

  def show

    @pool = Pool.find(params[:id])
    authenticate_view
    @user = User.new

    @users = User.where(pool_id: params[:id])
  end

  private

  def pool_params
    params.require(:pool).permit(
      :passcode
    )
  end

  protected

  def authenticate_view
    if @pool.passcode == params[:q]
      return true
    else
      redirect_to root_path
    end
  end
end
