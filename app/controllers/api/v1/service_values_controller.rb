class Api::V1::ServiceValuesController < ApplicationController
  before_action :set_service_value, only: %i[show update destroy]

  def index
    @service_values = ServiceValue.all
    render json: @service_values
  end

  def create
    @service_value = ServiceValue.new(service_value_params)
    if @service_value.save
      render json: @service_value, status: :created
    else
      render json: @service_value.errors, status: :unprocessable_entity
    end
  end

  def update
    @service_value = ServiceValue.find(params[:id])
    if @service_value.update(service_value_params)
      render json: @service_value
    else
      render json: @service_value.errors, status: :unprocessable_entity
    end
  end


  def show 
    @service_value = ServiceValue.find(params[:id])
    render json: @service_value
  end


  def destroy
    @service_value = ServiceValue.find(params[:id])
    @service_value.destroy
  end

  private

  def set_service_value
    @service_value = ServiceValue.find(params[:id])
  end

  def service_value_params
    params.require(:service_value).permit(:name, :value)
  end
end