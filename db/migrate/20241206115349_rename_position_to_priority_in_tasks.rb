class RenamePositionToPriorityInTasks < ActiveRecord::Migration[7.2]
  def change
    rename_column(:tasks, :position, :priority)
  end
end
