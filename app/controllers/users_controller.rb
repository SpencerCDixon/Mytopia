class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = "You have successfully updated your profile picture."
      redirect_to user_path(@user)
    else
      render "show"
    end
  end

  private

  def user_params
    params.require(:user).permit(:profile_photo, :email)
  end
end
