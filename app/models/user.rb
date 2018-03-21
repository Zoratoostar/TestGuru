class User < ApplicationRecord
  belongs_to :role
  has_many :test_evaluations
  has_many :tests, through: :test_evaluations
  has_many :authored_tests, class_name: 'Test', foreign_key: :user_id

  validates :email, presence: true

  def test_evaluation(test)
    test_evaluations.order(id: :desc).find_by(test_id: test.id)
  end
end
