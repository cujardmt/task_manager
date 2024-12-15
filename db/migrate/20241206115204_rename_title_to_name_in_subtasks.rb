class RenameTitleToNameInSubtasks < ActiveRecord::Migration[7.2]
  def change
    rename_column :subtasks, :title, :name
  end
end
