class CreateTrainings < ActiveRecord::Migration[5.0]
  def change
    create_table :trainings do |t|
      t.string :title
      t.string :trainer
      t.date :training_date

      t.timestamps
    end
  end
end
