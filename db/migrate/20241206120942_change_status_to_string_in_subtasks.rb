class ChangeStatusToStringInSubtasks < ActiveRecord::Migration[7.2]
  def change
    change_column :subtasks, :status, :string
  end
end
