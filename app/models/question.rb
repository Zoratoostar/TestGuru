class Question < ApplicationRecord
  belongs_to :test, counter_cache: true
  has_many :answer_options

  validates :body, presence: true
end
