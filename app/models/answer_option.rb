class AnswerOption < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  scope :right_options, -> { where(correct: true) }

  validate :validate_options_number

  private

  def validate_options_number
    if question.answer_options.count >= 4
      errors.add(:answer_options, 'is too many for one question')
    end
  end
end
