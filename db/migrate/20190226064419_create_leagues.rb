class CreateLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :leagues do |t|
      t.string :name
      t.integer :num_of_fleets

      t.timestamps
    end
  end
end
