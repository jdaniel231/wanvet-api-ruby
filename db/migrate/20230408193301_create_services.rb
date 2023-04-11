class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.references :user, null: false, foreign_key: true
      t.references :animal, null: false, foreign_key: true
      t.string :petetion
      t.string :process

      t.timestamps
    end
  end
end
