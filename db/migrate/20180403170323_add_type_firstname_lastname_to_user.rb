class AddTypeFirstnameLastnameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :type, :string, null: false, default: 'User'
    add_index  :users, :type
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
