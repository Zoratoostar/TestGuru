class AddUserIdToTest < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :user_id, :integer, default: 3, null: false
  end
end
