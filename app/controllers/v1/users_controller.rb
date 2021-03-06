class V1::UsersController < V1::BaseController
  before_action :authenticate_user!, except: [:index, :show]

  resource_description do
    desc("We're using devise_token_auth for creating and authenticating users.
          See https://github.com/lynndylanhurley/devise_token_auth#usage-tldr for documentation.
          The paths are nested at /v1/auth/. first_name and last_name are also required parameters.
          You can specify account_type=creative if you want the user to be a creative. phone_number
          is then required.")
  end

  def_param_group :user do
    param :user, Hash, action_aware:true do
      param :first_name, String
      param :last_name, String
      param :email, String
      param :phone_number, String
      param :account_type, %w(normal creative), required:false
    end
  end

  api! 'Index all users'
  def index
    @users = User.all
    render :json => @users
  end

  api! 'Show a specific user'
  param :id, String, required:true
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  api! 'Update a user'
  param_group :user
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
