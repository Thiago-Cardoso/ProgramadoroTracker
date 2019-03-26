class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :status
      t.datetime :end_date
      t.boolean :is_current
      t.integer :pomodoro_count
      t.bigint :work_time
      t.bigint :pause_time
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
