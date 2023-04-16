class Api::V1::ClientsController < ApplicationController
  # skip_before_action :authenticate_request
  before_action :set_client, only: %i[show update destroy]
  
  def index
    # GET /api/v1/clients
    @clients = Client.all
    render json: @clients, include: :animals
  end

  def show
    # GET /api/v1/clients/:id
    @client = Client.find(params[:id])
    render json: @client, include: :animals
  end

  def create
    # POST /api/v1/clients
    @client = Client.new(client_params)
    @client.user_id = current_user.id
    if @client.save
      render json: @client, status: :created
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  def update
    # PATCH/PUT /api/v1/clients/:id
    @client = Client.find(params[:id])
    if @client.update(client_params)
      render json: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  def destroy
    # DELETE /api/v1/clients/:id
    @client = Client.find(params[:id])
    @client.destroy
    head :no_content
  end

  def client_animals
    @client = Client.find(params[:client_id])
    @animals = @client.animals
    render json: @animals
  end


  def sum_clients
    total_sum = Client.where(deleted_at: nil).count

    render json: { total_sum: total_sum }
  end

  private
  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :phone, :user_id, animals_attributes: [:name, :id, :_destroy, :kg, :client_id])
  end
end
