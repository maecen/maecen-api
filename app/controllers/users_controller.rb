class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    render :json => @users
  end

  def new
  end

  def create
  end
end
