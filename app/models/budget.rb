class Budget < ApplicationRecord
  belongs_to :user
  belongs_to :service
  has_many :budget_services, dependent: :destroy

  accepts_nested_attributes_for :budget_services, allow_destroy: true

  before_save :calculate_total_value

  def total_services_value
    budget_services.sum(&:total_value)
  end

  def calculate_total_value
    self.total_value = budget_services.sum(&:total_value)
  end

  def as_json(options = {})
    super(options.merge(methods: [:total_services_value]))
  end
  
  def update_valor_total
    self.total_value = budget_services.sum(:total_value)
    save
  end

end
