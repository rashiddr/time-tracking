class AddCheckedToDailyStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :daily_statuses, :checked, :boolean
  end
end
