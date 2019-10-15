class UsersController < ApplicationController
  before_action :set_user
  before_action :authorize_user

  def show
    @orders = @user.orders.order(created_at: :desc)
  end

  private

  def authorize_user
    authorize @user
  end

  def set_user
    @user = User.find(params[:id])
  end
end
