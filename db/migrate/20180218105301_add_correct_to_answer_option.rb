class AddCorrectToAnswerOption < ActiveRecord::Migration[5.1]
  def change
    add_column :answer_options, :correct, :boolean, default: false, null: false
  end
end
