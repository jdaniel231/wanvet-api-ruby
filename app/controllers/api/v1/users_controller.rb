class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     # token = generate_jwt_token(@user.id, @user.email, @user.role)
  #     render json: @user.id, status: :created
  #   else
  #     render json: @user.errors, status: :unprocessable_entity
  #   end
  # end

  def create
    @user = User.new(user_params)
    if @user.save
      token = JsonWebToken.create_token(user_id: @user.id)
      render json: { user_id: @user.id, token: token }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # token = generate_jwt_token(@user.id, @user.email, @user.role)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    head :no_content
  end

  private

  # def generate_jwt_token(user_id, email, role)
  #   payload = { user_id: user_id, email: email, role: role }
  #   JsonWebToken.create_token(payload)
  # end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end
end
