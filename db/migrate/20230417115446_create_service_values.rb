class CreateServiceValues < ActiveRecord::Migration[7.0]
  def change
    create_table :service_values do |t|
      t.string :name
      t.decimal :value

      t.timestamps
    end
  end
end
