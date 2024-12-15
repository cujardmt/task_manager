class ChangeCompletedToStatusInTasks < ActiveRecord::Migration[7.2]
  def change
    # is there a better way of doing this?
    rename_column :tasks, :completed, :status
    change_column :tasks, :status, :string
  end
end
