class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :daily_status_id
      t.integer :user_id
      t.text :comments

      t.timestamps
    end
  end
end
