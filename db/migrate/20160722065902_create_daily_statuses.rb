class CreateDailyStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :daily_statuses do |t|
      t.integer :user_id
      t.date :status_date
      t.integer :project_id
      t.integer :duration
      t.text :work_done

      t.timestamps
    end
  end
end
