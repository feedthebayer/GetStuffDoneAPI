class Api::ListsController < ApplicationController
  def show
    render json: List.find(params[:id])
  end

  def index
    render json: List.all
  end
end
