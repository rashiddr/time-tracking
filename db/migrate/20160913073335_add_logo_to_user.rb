class AddLogoToUser < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :users, :logo
  end
end
