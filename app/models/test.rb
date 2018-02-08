class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  belongs_to :user
  has_many :evaluations
  has_many :users, through: :evaluations

  def self.titles_of(category_name)
    category = Category.where(title: category_name).first
    return [] unless category
    self.where(category_id: category.id).order(title: :DESC).pluck(:title)
  end
end
