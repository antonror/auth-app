class Api::V1::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token
  before_action :user_params, only: :create
  before_action :fetch_user, only: :create

  # User login action
  def create
    if @user.valid_password?(sign_in_params[:password])
      sign_in "user", @user
      render json: {
          messages: "Signed In Successfully",
          is_success: true,
          data: {user: @user}
      }, status: :ok
    else
      render json: {
          messages: "Signed In Failed - Unauthorized",
          is_success: false,
          data: {}
      }, status: :unauthorized
    end
  end

  private
  def user_params
    params.require(:user).permit :email, :password
  end

  def fetch_user
    @user = User.find_for_database_authentication(email: sign_in_params[:email])
    if @user
      return @user
    else
      render json: {
          messages: "User was not found",
          is_success: false,
          data: {}
      }, status: :failure
    end
  end
end