class AddColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :budgets, :received_box, :integer
  end
end
