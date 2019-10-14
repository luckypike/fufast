class SessionsController < ApplicationController
  before_action :authorize_session

  def create
    user = User.find_by('LOWER(email) = :email', email: params[:user][:email].downcase.strip)

    if user&.valid_password?(params[:user][:password].strip)
      sign_in(user)
      head :ok, location: user_path(user)
    else
      render json: user ? { password: ['Неверный пароль'] } : { email: ['Нет заказов с этой почтой'] }, status: :unprocessable_entity
    end
  end

  def recovery
    user = User.find_by('LOWER(email) = :email', email: params[:user][:email].downcase.strip)

    if user
      token = Digest::MD5.hexdigest(SecureRandom.alphanumeric)
      salt = SecureRandom.alphanumeric(8)
      user.update_attribute(:checkword, salt + Digest::MD5.hexdigest(salt + token))

      UserMailer.with(user: user, token: token).recovery.deliver_now
      head :ok
    else
      render json: { email: ['Нет заказов с этой почтой'] }, status: :unprocessable_entity
    end
  end

  def rereset
    render layout: false
  end

  def reset
    user = User.find_by('LOWER(email) = :email', email: params[:email].downcase.strip) if params[:email]

    if user&.valid_token?(params[:token].strip)
      password = SecureRandom.alphanumeric
      salt = SecureRandom.alphanumeric(8)
      user.update_attribute(:password, salt + Digest::MD5.hexdigest(salt + password))

      UserMailer.with(user: user, password: password).reset.deliver_now
      sign_in(user)
      redirect_to user_path(user)
    else
      head :ok
    end
  end

  private

  def authorize_session
    authorize :session
  end
end
