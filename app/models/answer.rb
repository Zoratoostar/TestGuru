class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  scope :right_answers, -> { where(correctness: true) }
end
