class ApplicationController < ActionController::Base
  include Pundit

  before_action :set_current_user
  after_action :verify_authorized

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def set_current_user
    Current.user = current_user
  end

  def current_user
    @current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end

  def user_not_authorized(exception)
    redirect_to root_path
  end

  def sign_in(user)
    session[:current_user_id] = user.id
  end
end
