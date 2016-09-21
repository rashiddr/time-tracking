class AddProfileCompleteToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :profile_completion, :boolean, default:false
  end
end
