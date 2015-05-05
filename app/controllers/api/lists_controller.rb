class Api::ListsController < ApplicationController
  before_action :authenticated?

  def create
    list = current_user.lists.new(list_params)
    if list.save
      render json: list
    else
      error(:unprocessable_entity, list.errors.full_messages)
    end
  end

  def show
    begin
      list = List.find(params[:id])

      if not_mine?(list)
        not_yours_error
      else
        render json: list
      end
    rescue ActiveRecord::RecordNotFound
      error(:not_found, "That list doesn't exist")
    end
  end

  def index
    render json: current_user.lists
  end

  def destroy
    begin
      list = List.find(params[:id])

      if not_mine?(list)
        not_yours_error
      else
        list.destroy
        render json: {}, status: :no_content
      end
    rescue ActiveRecord::RecordNotFound
      error(:not_found, "That list doesn't exist")
    end
  end

  private

  def list_params
    params.permit(:name)
  end
end
