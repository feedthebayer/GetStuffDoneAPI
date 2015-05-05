class Api::UsersController < ApplicationController
  before_action :authenticated?, except: :create

  def create
    user = User.new(user_params)

    if user.save
      render json: user
    else
      error(:unprocessable_entity, list.errors.full_messages)
    end
  end

  def show
    begin
      render json: User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      error(:not_found, "That list doesn't exist")
    end
  end

  def index
    render json: User.all
  end

  def destroy
    begin
      user = User.find(params[:id])

      if user != current_user
        not_yours_error
      else
        user.destroy
        render json: {}, status: :no_content
      end
    rescue ActiveRecord::RecordNotFound
      error(:not_found, "That user doesn't exist")
    end
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
