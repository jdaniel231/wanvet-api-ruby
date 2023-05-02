class Api::V1::BudgetsController < ApplicationController
  before_action :set_budget, only: %i[show update destroy destroy_service create_budget_service]

  def index
    @budgets = Budget.joins(service: { animal: :client }, user: {})
                      .select('budgets.*, animals.name as animal_name, clients.name as client_name')
                      .order(created_at: :desc)
    render json: @budgets
  end

  def create
    @budget = Budget.new(budget_params)
    @budget.user_id = current_user.id
    @budget.status = 'open'

    @budget.budget_services.each do |bs|
     bs.discount ||= 0 
    bs.calculate_total_value
    end

    @budget.calculate_total_value
    if @budget.save
      render json: @budget, status: :created
    else
      render json: @budget.errors, status: :unprocessable_entity
    end
  end

  def show
    # GET /api/v1/budgets/:id
    @budget = Budget.find(params[:id])
    render json: @budget, include: :budget_services
  end

  def update
    @budget = Budget.find(params[:id])
    if @budget.update(budget_params)
      render json: @budget
    else
      render json: @budget.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @budget = Budget.find(params[:id])
    @budget.destroy
    head :no_content
  end

  def destroy_service
    @budget = Budget.find(params[:id])
    budget_service = @budget.budget_services.find(params[:budget_service_id])
    budget_service.destroy
    @budget.update_valor_total
    head :no_content
  end


  private

  def set_budget
    @client = Budget.find(params[:id])
  end

  def budget_params
    params.require(:budget).permit(:service_id, :user_id, :total_value, :payment_type, :status, budget_services_attributes: [:id, :service_value_id, :discount, :total_value, :_destroy])
  end
end
