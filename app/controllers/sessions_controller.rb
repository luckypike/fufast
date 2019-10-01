class SessionsController < ApplicationController
  before_action :authorize_session

  def create
    user = User.find_by('LOWER(email) = :email', email: params[:user][:email].downcase.strip)

    if user.valid_password?(params[:user][:password].strip)
      sign_in(user)
      head :ok
    else
    end
  end

  private

  def authorize_session
    authorize :session
  end
end
