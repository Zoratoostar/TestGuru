class User < ApplicationRecord
  belongs_to :role
  has_many :test_evaluations
  has_many :tests, through: :test_evaluations
  has_many :answers
  has_many :questions, through: :answers

  validates :email, presence: true
end
