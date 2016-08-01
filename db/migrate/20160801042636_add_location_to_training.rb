class AddLocationToTraining < ActiveRecord::Migration[5.0]
  def change
    add_column :trainings, :location, :string
  end
end
