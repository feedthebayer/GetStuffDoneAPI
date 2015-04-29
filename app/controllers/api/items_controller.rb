class Api::ItemsController < ApplicationController
  before_action :authenticated?

  def show
    render json: Item.find(params[:id])
  end

  def index
    render json: Item.all
  end
end
