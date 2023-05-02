class AddColumnBudget < ActiveRecord::Migration[7.0]
  def change
    add_column :budgets, :status, :string
    add_column :budgets, :payment_type, :string
  end
end
