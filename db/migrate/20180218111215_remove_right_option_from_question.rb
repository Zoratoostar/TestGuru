class RemoveRightOptionFromQuestion < ActiveRecord::Migration[5.1]
  def change
    remove_column :questions, :right_option, :string, limit: 3, default: "A"
  end
end
