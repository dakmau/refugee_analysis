class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :user_id, index: true

      t.timestamps null: false
    end
  end
end
