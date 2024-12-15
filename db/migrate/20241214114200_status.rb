class Status < ActiveRecord::Migration[7.2]
  def change
    create_table :statuses do |t|
      t.string :name
      t.text :description
    end
  end
end
