class AddClosedAtToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :closed_at, :datetime
  end
end
