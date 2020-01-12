class CreatePrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :programs do |t|
      t.string :title, null: false
      t.daterange :activity_period, null: false

      t.timestamps
    end
  end
end
