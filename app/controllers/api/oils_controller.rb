class Api::OilsController < ApplicationController

before_action :set_oil, only: [:show, :update, :destroy]

  def index
    render json: Oil.all
  end

  def create
    oil = Oil.new(oil_params)
    if oil.save
      render json: oil
    else
      render json: { message: oil.errors }, status: 400
    end
  end

  def show
    render json: @oil
  end

  def update
    if @oil.update(oil_params)
      render json: @oil
    else
      render json: { message: oil.errors }, status: 400
    end
  end

  def destroy
    if @oil.destroy
      render json: { message: "Deleted" }, status: 204
    else
      render json: { message: "Unable to remove this oil" }, status: 400
    end
  end



  private

  def set_oil
    @oil = Oil.find_by(id: params[:id])
  end

  def oil_params
    params.require(:oil).permit(:name, :uses, :description, :img_url)
  end
end