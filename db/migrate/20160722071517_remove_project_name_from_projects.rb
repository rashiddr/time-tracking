class RemoveProjectNameFromProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :project_name, :int
  end
end
