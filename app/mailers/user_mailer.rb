class UserMailer < ApplicationMailer
  def recovery
    @user = params[:user]
    @reset_url = reset_url(email: @user.email, token: params[:token])
    mail(to: @user.email, subject: 'Восстановление доступа')
  end

  def reset
    @user = params[:user]
    @password = params[:password]
    mail(to: @user.email, subject: 'Сброс пароля')
  end
end
