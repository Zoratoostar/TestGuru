class RenameTableEvaluationToTestEvaluation < ActiveRecord::Migration[5.1]
  def change
    rename_table('evaluations', 'test_evaluations')
  end
end
