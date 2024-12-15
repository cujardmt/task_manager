class AddPriorityAndStatusColumToTasks < ActiveRecord::Migration[7.2]
  def change
    # add_reference :tasks, :priority, null: false, foreign_key: true
    # remove_column :tasks, :status_id, :integer
    # remove_column :tasks, :statuses_id, :integer
    # add_reference :tasks, :status, null: false, foreign_key: true
  end
end
