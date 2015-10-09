class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @users = User.all
    render :json => @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def update
    if @user.update user_params
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,:phone_number)
  end
end
