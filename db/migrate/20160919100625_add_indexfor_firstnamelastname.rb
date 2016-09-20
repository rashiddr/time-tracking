class AddIndexforFirstnamelastname < ActiveRecord::Migration[5.0]
  def change
  	add_index :users, [:first_name,:last_name]
  end
end
