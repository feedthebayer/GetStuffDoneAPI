class Api::UsersController < ApplicationController
  before_action :authenticated?, except: :create

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def show
    render json: User.find(params[:id])
  end

  def index
    render json: User.all
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
