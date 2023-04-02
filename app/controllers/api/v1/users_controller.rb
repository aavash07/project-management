# class for user
class Api::V1::UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({user_id: @user.id})
      render :show
    else
      render json: {error: 'Invalid email or password'}
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(email: auth_params[:email])

    if @user && @user.authenticate(auth_params[:password])
      @token = encode_token({user_id: @user.id})
      render :show
    else
      render json: {error: 'Invalid email or password'}
    end
  end

  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :country)
  end

  def auth_params
    params.require(:auth).permit(:email, :password)
  end
end
