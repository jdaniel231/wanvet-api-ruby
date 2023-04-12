class Api::V1::ServicesController < ApplicationController

  before_action :set_service, only: %i[show update destroy]

  def index   
    @services = Service.joins(:animal, :user).select(
      'services.*, animals.name as animal_name, users.name as user_name'
    ).order(created_at: :desc).all
    render json: @services
  end

  def show 
    @service = Service.find(params[:id])
    render json: @service
  end

  def create
    @service = Service.new(service_params)
    @service.user_id = current_user.id
    if @service.save
      render json: @service, status: :created
    else
      render json: @service.errors, status: :unprocessable_entity
    end

  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      render json: @service
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    head :no_content
  end

  private
  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:petetion, :process, :animal_id, :user_id)
  end
end
