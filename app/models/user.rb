class User < ApplicationRecord
  def touched_tests(level)
    test_ids = Evaluation.where(user_id: self.id).pluck(:test_id).uniq
    Test.where(level: level, id: test_ids)
  end
end
