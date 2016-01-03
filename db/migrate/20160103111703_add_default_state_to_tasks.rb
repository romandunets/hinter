class AddDefaultStateToTasks < ActiveRecord::Migration
  def change
  	change_column :tasks, :state, :string, default: "open"
  end
end
