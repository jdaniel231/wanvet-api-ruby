class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.integer :service_id
      t.integer :user_id
      t.float :total_value

      t.timestamps
    end
  end
end
