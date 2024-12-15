class CreateSubtasks < ActiveRecord::Migration[7.2]
  def change
    create_table :subtasks do |t|
      t.string :title
      t.boolean :status

      t.timestamps
    end
  end
end
