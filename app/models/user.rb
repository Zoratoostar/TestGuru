require 'digest/sha1'

class User < ApplicationRecord

  include Auth

  belongs_to :role, default: -> { Role.find_by(name: 'Пользователь') }
  has_many :test_evaluations
  has_many :tests, through: :test_evaluations
  has_many :authored_tests, class_name: 'Test', foreign_key: :user_id

  def test_evaluation(test)
    test_evaluations.order(id: :desc).find_by(test_id: test.id)
  end

end
