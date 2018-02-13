class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  has_many :users, through: :answers
end
