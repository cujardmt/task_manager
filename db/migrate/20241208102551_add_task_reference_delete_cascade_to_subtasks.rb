class AddTaskReferenceDeleteCascadeToSubtasks < ActiveRecord::Migration[7.2]
  def change
    remove_column :subtasks, :task_id, :integer
    add_reference :subtasks, :task, null: false, foreign_key: { on_delete: :cascade }
  end
end
