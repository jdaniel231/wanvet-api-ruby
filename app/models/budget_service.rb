class BudgetService < ApplicationRecord
  belongs_to :budget
  belongs_to :service_value

  before_save :calculate_total_value

  def calculate_total_value
    self.total_value = service_value.value - discount
  end

  def as_json_with_service_name
    {
      id: id,
      budget_id: budget_id,
      service_value_id: service_value.as_json(only: [:name]), # inclui o nome do serviço
      discount: discount,
      total_value: total_value,
      created_at: created_at,
      updated_at: updated_at
    }
  end
end
