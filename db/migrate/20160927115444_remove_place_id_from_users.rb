class RemovePlaceIdFromUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :place_id
  end
end
