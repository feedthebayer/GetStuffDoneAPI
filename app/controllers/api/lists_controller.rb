class Api::ListsController < ApplicationController
  before_action :authenticated?

  def create
    list = current_user.lists.new(list_params)
    if list.save
      render json: list
    else
      render json: { errors: list.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def show
    list = List.find_by(id: params[:id])

    if !list
      error(:not_found, "That list doesn't exist")
    elsif list.user != current_user
      error(:unprocessable_entity, "That's not your list!")
    else
      render json: list
    end
  end

  def index
    render json: current_user.lists
  end

  private

  def list_params
    params.permit(:name)
  end
end
