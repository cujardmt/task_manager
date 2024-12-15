class AddPrirityAndStatusToTasks < ActiveRecord::Migration[7.2]
  def change
    add_reference :tasks, :priority, null: false, foreign_key: true
    add_reference :tasks, :status, null: false, foreign_key: true
  end
end