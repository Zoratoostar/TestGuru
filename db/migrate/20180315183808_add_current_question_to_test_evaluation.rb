class AddCurrentQuestionToTestEvaluation < ActiveRecord::Migration[5.1]
  def change
    add_reference :test_evaluations, :current_question, foreign_key: true
  end
end
