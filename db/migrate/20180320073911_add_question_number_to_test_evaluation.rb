class AddQuestionNumberToTestEvaluation < ActiveRecord::Migration[5.1]
  def change
    add_column :test_evaluations, :question_number, :integer
  end
end
