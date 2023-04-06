class Api::V1::AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :update, :destroy]

  def index
    @animals = Animal.all
    render json: @animals
  end

  def show
    render json: @animal
  end

  def create
    @client = Client.find(params[:client_id])
    @animal = @client.animals.build(animal_params)

    if @animal.save
      render json: @animal, status: :created
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  def update
    if @animal.update(animal_params)
      render json: @animal
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @animal.destroy
      head :no_content
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  private

  def set_animal
    if params[:client_id]
      @client = Client.find(params[:client_id])
      @animal = @client.animals.find(params[:id])
    else
      @animal = Animal.find(params[:id])
    end
  end

  def animal_params
    params.require(:animal).permit(:name, :kg)
  end
end
