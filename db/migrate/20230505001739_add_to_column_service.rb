class AddToColumnService < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :kg, :string
  end
end
