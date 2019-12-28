# Registrations controller
class Api::V1::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token
  before_action :check_params, only: :create

  # User creation action
  def create
    user = User.new user_params
    if user.save
      render json: {
          messages: "Sign Up Successfully",
          is_success: true,
          data: {user: user}
      }, status: :ok
    else
      render json: {
          messages: "Sign Up Failded",
          is_success: false,
          data: {}
      }, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def check_params
    return if params[:user].present?
    render json: {
        messages: "Missing Params",
        is_success: false,
        data: {}
    }, status: :bad_request
  end
end