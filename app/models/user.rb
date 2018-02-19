class User < ApplicationRecord
  belongs_to :role
  has_many :test_evaluations
  has_many :tests, through: :test_evaluations

  validates :email, presence: true
end
