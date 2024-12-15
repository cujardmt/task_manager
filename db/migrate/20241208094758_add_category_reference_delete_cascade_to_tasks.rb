class AddCategoryReferenceDeleteCascadeToTasks < ActiveRecord::Migration[7.2]
  def change
    # Remove the existing column
    remove_column :tasks, :category_id, :integer
    add_reference :tasks, :category, null: false, foreign_key: { on_delete: :cascade }
  end
end
