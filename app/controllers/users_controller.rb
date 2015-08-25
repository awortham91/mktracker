class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.pool_id = params[:pool_id]
    if @user.save
      redirect_to 'http://google.com'
    end
  end



  private

  def user_params
    params.require(:user).permit(
      :name, :pool_id
    )
  end
end
