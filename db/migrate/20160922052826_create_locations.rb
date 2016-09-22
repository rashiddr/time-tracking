class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.integer :user_id
      t.string :place_id
      t.float :latitude
      t.float :longitude
      t.string :time_zone

      t.timestamps
    end
  end
end
