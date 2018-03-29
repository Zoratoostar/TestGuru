class User < ApplicationRecord
  belongs_to :role, default: -> { Role.find_by(name: 'Пользователь') }
  has_many :test_evaluations
  has_many :tests, through: :test_evaluations
  has_many :authored_tests, class_name: 'Test', foreign_key: :user_id

  validates :name, presence: true
  validates :email, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_uniqueness_of :email

  has_secure_password

  def test_evaluation(test)
    test_evaluations.order(id: :desc).find_by(test_id: test.id)
  end
end
