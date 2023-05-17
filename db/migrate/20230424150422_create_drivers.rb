class CreateDrivers < ActiveRecord::Migration[7.0]
  def change
    create_table :drivers do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_reference :drivers, :crawler, foreign_key: true
  end
end
