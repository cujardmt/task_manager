class AddTaskToSubtasks < ActiveRecord::Migration[7.2]
  def change
    add_column(:subtasks, :task_id, :integer)
  end
end
