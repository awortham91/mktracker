class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.pool_id = params[:pool_id]
    if @user.save
      @pool = Pool.find(params[:pool_id])
      redirect_to pool_path(params[:pool_id], q: @pool.passcode)
    end
  end



  private

  def user_params
    params.require(:user).permit(
      :name, :pool_id
    )
  end
end
