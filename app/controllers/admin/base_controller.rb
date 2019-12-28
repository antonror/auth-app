class Admin::BaseController < ApplicationController
  before_action :check_if_admin!

  def check_if_admin!
    unless current_user and current_user.admin?
      redirect_to root_path
    end
  end
end