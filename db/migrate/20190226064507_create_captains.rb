class CreateCaptains < ActiveRecord::Migration[5.2]
  def change
    create_table :captains do |t|
      t.string :username
      t.string :password
      t.string :password_digest
      t.string :email

      t.timestamps
    end
  end
end
