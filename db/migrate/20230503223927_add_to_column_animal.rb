class AddToColumnAnimal < ActiveRecord::Migration[7.0]
  def change
    add_column :animals, :age, :string
    add_column :animals, :castrated, :string
    add_column :animals, :species, :string
    add_column :animals, :sex, :string
    add_column :animals, :breed, :string
  end
end
