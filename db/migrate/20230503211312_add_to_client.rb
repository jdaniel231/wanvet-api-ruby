class AddToClient < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :document_number, :string
    add_column :clients, :address, :string
    add_column :clients, :address_number, :string
    add_column :clients, :address_compl, :string
    add_column :clients, :neighborhood, :string
    add_column :clients, :zip_code, :string
    add_column :clients, :city, :string
    add_column :clients, :state, :string
  end
end
