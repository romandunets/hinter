class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :priority
      t.string :state
      t.datetime :deadline
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :tasks, [:user_id, :created_at]
  end
end
