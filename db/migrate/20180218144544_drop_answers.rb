class DropAnswers < ActiveRecord::Migration[5.1]
  def change
    drop_table :answers do |t|
      t.integer :user_id, null: false
      t.integer :question_id, null: false
      t.string :given_option
      t.boolean :correctness

      t.timestamps
    end
  end
end
