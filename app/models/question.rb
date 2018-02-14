class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  has_many :users, through: :answers
  has_many :answer_options

  validates :body, presence: true

  validate :validate_number_options

  private

  def validate_number_options
    errors.add(:answer_options_count, 'is not in 2..4') unless answer_options.count.between?(2, 4)
  end
end
