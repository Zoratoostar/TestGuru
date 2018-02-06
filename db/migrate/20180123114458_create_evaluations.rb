class CreateEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.integer :user_id
      t.integer :test_id
      t.datetime :started_at
      t.datetime :finished_at
      t.decimal :percent

      t.timestamps
    end
  end
end
