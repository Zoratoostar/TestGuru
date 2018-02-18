class Question < ApplicationRecord
  belongs_to :test
  has_many :answer_options

  validates :body, presence: true
end
