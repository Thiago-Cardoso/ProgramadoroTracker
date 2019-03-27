class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.references :user, foreign_key: true
      t.string :description, limit: 200

      t.timestamps
    end
  end
end
