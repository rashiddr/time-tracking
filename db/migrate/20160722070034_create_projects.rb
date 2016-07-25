class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.integer :project_name
      t.string :client
      t.text :description

      t.timestamps
    end
  end
end
