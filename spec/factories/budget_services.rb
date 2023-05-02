FactoryBot.define do
  factory :budget_service do
    budget_id { 1 }
    service_value_id { 1 }
    discount { 1.5 }
    total_value { 1.5 }
  end
end
