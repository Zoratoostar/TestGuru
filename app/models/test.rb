class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :test_evaluations
  has_many :users, through: :test_evaluations

  def self.titles_of(category_name)
    category = Category.where(title: category_name).first
    return [] unless category
    self.where(category_id: category.id).order(title: :DESC).pluck(:title)
  end
end
