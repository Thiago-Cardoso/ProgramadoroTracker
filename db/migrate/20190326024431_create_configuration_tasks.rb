class CreateConfigurationTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :configuration_tasks do |t|
      t.references :user, foreign_key: true
      t.integer :duration
      t.integer :duration_break
      t.integer :duration_break_long
      t.integer :long_pause_delay
      t.boolean :have_song
      t.integer :template

      t.timestamps
    end
  end
end
