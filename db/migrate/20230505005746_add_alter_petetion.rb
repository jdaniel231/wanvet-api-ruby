class AddAlterPetetion < ActiveRecord::Migration[7.0]
  def change
    change_column :services, :petetion, :text
  end
end
