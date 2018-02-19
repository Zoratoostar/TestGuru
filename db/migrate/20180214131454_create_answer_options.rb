class CreateAnswerOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_options do |t|
      t.string :title
      t.string :body
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
