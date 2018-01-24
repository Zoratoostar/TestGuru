class AddEvaluationUserIdTestIdStartedAtNullConstraint < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:evaluations, :user_id, false)
    change_column_null(:evaluations, :test_id, false)
    change_column_null(:evaluations, :started_at, false)
  end
end
