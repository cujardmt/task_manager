class AddUsernameColToUsersTable < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :username, :string
    # ensure unique username
    # add_index :users, :username, unique: true
    # ensure unique email
    # add_index :users, :email, unique: true
  end
end
