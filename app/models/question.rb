class Question < ApplicationRecord
  belongs_to :test, counter_cache: true
  has_many :answer_options, dependent: :delete_all

  validates :body, presence: true
end
