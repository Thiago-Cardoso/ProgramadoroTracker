class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.string :description, limit: 200
      t.datetime :date_end
      t.boolean :is_current
      t.string :status

      t.timestamps
    end
  end
end
