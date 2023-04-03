class Api::V1::ClientsController < ApplicationController
  def index
    # GET /api/v1/clients
    @clients = Client.all
    render json: @clients
  end

  def show
    # GET /api/v1/clients/:id
    @client = Client.find(params[:id])
    render json: @client
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

  private

  def client_params
    params.require(:client).permit(:name, :phone, :user_id)
  end
end
