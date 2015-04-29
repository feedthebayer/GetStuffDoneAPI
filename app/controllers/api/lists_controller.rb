class Api::ListsController < ApplicationController
  before_action :authenticated?

  def show
    render json: List.find(params[:id])
  end

  def index
    render json: List.all
  end
end
