class AddDefaultValueToDailyStatusAttribute < ActiveRecord::Migration[5.0]
  def up
  	change_column :daily_statuses, :checked, :boolean, :default => false
  end

  def down
  	change_column :daily_statuses, :checked, :boolean, :default => nil
  end
end
