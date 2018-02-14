class Category < ApplicationRecord
  has_many :tests

  default_scope { order(title: :ASC) }

  validates :title, presence: true
end
