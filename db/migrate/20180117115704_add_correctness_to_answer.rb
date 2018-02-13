class AddCorrectnessToAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column(:answers, :correctness, :boolean)
  end
end
