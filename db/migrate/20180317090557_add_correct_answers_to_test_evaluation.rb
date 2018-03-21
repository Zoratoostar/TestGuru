class AddCorrectAnswersToTestEvaluation < ActiveRecord::Migration[5.1]
  def change
    add_column :test_evaluations, :correct_answers, :integer, default: 0
  end
end
