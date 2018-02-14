class AddBodyNotNullToAnswerOption < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:answer_options, :body, false)
  end
end
