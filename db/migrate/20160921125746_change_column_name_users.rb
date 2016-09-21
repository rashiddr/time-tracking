class ChangeColumnNameUsers < ActiveRecord::Migration[5.0]
  def change
  	rename_column :users, :current_location, :place_id
  end
end
