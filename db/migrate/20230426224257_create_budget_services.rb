class CreateBudgetServices < ActiveRecord::Migration[7.0]
  def change
    create_table :budget_services do |t|
      t.integer :budget_id
      t.integer :service_value_id
      t.float :discount
      t.float :total_value

      t.timestamps
    end
  end
end
