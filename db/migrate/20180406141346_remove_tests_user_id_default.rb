class RemoveTestsUserIdDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:tests, :user_id, from: 3, to: nil)
  end
end
