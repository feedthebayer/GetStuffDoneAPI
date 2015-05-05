class Api::ItemsController < ApplicationController
  before_action :authenticated?

  def create
    begin
      list = List.find(params[:list_id])

      if not_mine?(list)
        not_yours_error
      else
        item = list.items.new(item_params)
        if item.save
          render json: item
        else
          render json: { errors: item.errors.full_messages },
            status: :unprocessable_entity
        end
      end
    rescue ActiveRecord::RecordNotFound
      error(:not_found, "That list doesn't exist")
    end
  end

  def show
    begin
      item = Item.find(params[:id])

      if not_mine?(item)
        not_yours_error
      else
        render json: item
      end
    rescue ActiveRecord::RecordNotFound
      error(:not_found, "That item doesn't exist")
    end
  end

  def update
    begin
      item = Item.find(params[:id])

      if not_mine?(item)
        not_yours_error
      else
        item.update(item_params)
        render json: item
      end
    rescue ActiveRecord::RecordNotFound
      error(:not_found, "That item doesn't exist")
    end
  end

  def index
    render json: current_user.items
  end

  def destroy
    begin
      item = Item.find(params[:id])

      if not_mine?(item)
        not_yours_error
      else
        item.destroy
        render json: {}, status: :no_content
      end
    rescue ActiveRecord::RecordNotFound
      error(:not_found, "That item doesn't exist")
    end
  end


  private

  def item_params
    params.permit(:description)
  end
end
