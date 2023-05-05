class AddDeleteRequeriment < ActiveRecord::Migration[7.0]
  def change
    remove_column :services, :process
    add_column :services, :obs, :text
  end
end
