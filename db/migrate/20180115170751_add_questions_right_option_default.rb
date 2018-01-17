class AddQuestionsRightOptionDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :questions, :right_option, from: nil, to: 'A'
  end
end
