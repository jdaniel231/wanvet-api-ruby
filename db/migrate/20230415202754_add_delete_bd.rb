class AddDeleteBd < ActiveRecord::Migration[7.0]
  def change
    add_column :animals, :deleted_at, :datetime
    add_column :clients, :deleted_at, :datetime
    add_column :services, :deleted_at, :datetime
  end
end
