class ApplicationController < ActionController::Base
  before_action :set_current_user

  private

  def set_current_user
    Current.user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end
end
