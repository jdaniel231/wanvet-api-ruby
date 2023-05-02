class BudgetService < ApplicationRecord
  belongs_to :budget
  belongs_to :service_value

  before_save :calculate_total_value

  def calculate_total_value
    self.total_value = service_value.value - discount
  end
end
