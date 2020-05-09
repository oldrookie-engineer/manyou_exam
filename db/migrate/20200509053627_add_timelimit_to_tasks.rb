class AddTimelimitToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :timelimit, :date, null: :false
  end
end
