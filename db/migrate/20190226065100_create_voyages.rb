class CreateVoyages < ActiveRecord::Migration[5.2]
  def change
    create_table :voyages do |t|
      t.string :dep_port
      t.string :arr_port
      t.integer :distance
      t.integer :cargo
      t.references :ship
      t.references :captain

      t.timestamps
    end
  end
end
