class Api::ItemsController < ApplicationController
  before_action :authenticated?

  def create
    if !list = List.find_by(id: params[:list_id])
      error(:not_found, "That list doesn't exist")
    elsif list.user != current_user
      error(:unprocessable_entity, "You can't add to someone else's list!")
    else
      item = list.items.new(item_params)
      if item.save
        render json: item
      else
        render json: { errors: item.errors.full_messages },
          status: :unprocessable_entity
      end
    end
  end

  def show
    item = Item.find_by(id: params[:id])

    if !item
      error(:not_found, "That item doesn't exist")
    elsif item.user != current_user
      error(:unprocessable_entity, "That's not your item!")
    else
      render json: item
    end
  end

  def index
    render json: current_user.items
  end

  private

  def item_params
    params.permit(:description)
  end
end
