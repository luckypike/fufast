class SessionsController < ApplicationController
  def create
    user = User.find_by('LOWER(email) = :email', email: params[:user][:email].downcase.strip)

    if user.valid_password?(params[:user][:password].strip)
      session[:current_user_id] = user.id
      head :ok
    else
    end
  end
end
