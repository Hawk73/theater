class CreatePrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :programs do |t|
      t.string :title, null: false
      t.daterange :activity_period, null: false

      t.timestamps
    end

    execute "ALTER TABLE programs ADD CONSTRAINT programs_activity_period_excl EXCLUDE USING GIST (activity_period WITH &&)"
  end
end
