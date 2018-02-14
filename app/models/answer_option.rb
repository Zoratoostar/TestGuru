class AnswerOption < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  scope :right_options, -> { joins(:question).where('questions.right_option = ?', :title) }
end
