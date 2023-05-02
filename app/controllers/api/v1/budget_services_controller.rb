class Api::V1::BudgetServicesController < ApplicationController
  before_action :set_budget_service, only: %i[show, destroy]

  def index
    @budget_services = BudgetService.all
    render json: @budget_services
  end

  def create
    @budget = Budget.find(params[:budget_id])
    @budget_service = @budget.budget_services.build(budget_params)
    @budget_service.discount ||= 0.to_d
    @budget_service.calculate_total_value
  
    if @budget_service.save
      @budget.calculate_total_value
      @budget.save
      render json: @budget, include: :budget_services, status: :created
    else
      render json: @budget_service.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    @budget_service.destroy
    head :no_content
  end

  private

  def set_budget_service
    if params[:budget_id]
      @budget = Budget.find(params[:budget_id])
      @budget_service = @budget.budget_services.find(params[:id])
    else
      @budget_service = BudgetService.find(params[:id])
    end
  end

  def budget_params
    params.require(:budget_service).permit(:service_value_id, :discount, :total_value, :budget_id)
  end
end
