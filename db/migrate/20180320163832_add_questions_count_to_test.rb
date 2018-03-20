class AddQuestionsCountToTest < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :questions_count, :integer
  end
end
