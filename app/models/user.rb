class User < ApplicationRecord
  belongs_to :role
  has_many :evaluations
  has_many :tests, through: :evaluations
  has_many :answers
  has_many :questions, through: :answers

  def touched_tests(level)
    test_ids = Evaluation.where(user_id: self.id).pluck(:test_id).uniq
    Test.where(level: level, id: test_ids)
  end
end
