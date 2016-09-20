class AddMissingIndexes < ActiveRecord::Migration[5.0]
    def change
        add_index :daily_statuses, :user_id
        add_index :daily_statuses, :project_id
        add_index :projects, :project_manager
        add_index :user_projects, :user_id
        add_index :user_projects, :project_id
    end
end
