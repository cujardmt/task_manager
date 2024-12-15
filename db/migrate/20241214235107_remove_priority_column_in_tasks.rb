class RemovePriorityColumnInTasks < ActiveRecord::Migration[7.2]
  def change
    remove_column :tasks, :priority, :string
  end
end
