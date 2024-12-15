class Priorities < ActiveRecord::Migration[7.2]
  def change
    create_table :priorities do |t|
      t.string :name
      t.text :description
    end
  end
end
