class Public::UsersController < ApplicationController
  def show
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  def user_params
    params.require(:user).permit(:name, :note, :profile_image)
  end
end
