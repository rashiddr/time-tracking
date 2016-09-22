class AddPlaceNameToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :place_name, :string
  end
end
