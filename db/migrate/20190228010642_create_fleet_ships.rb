class CreateFleetShips < ActiveRecord::Migration[5.2]
  def change
    create_table :fleet_ships do |t|
        t.references :fleet
        t.references :ship

        t.timestamps
    end
  end
end
