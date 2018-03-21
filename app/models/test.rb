class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :questions
  has_many :test_evaluations
  has_many :users, through: :test_evaluations

  validates :title, presence: true
  validates :level, inclusion: { in: 0..Float::INFINITY }
  # validates_numericality_of :level, only_integer: true, greater_than_or_equal_to: 0
  validates_uniqueness_of :title, scope: :level

  scope :basic, -> { where(level: 0) }
  scope :medium, -> { where(level: 1..4) }
  scope :advanced, -> { where(level: 5..Float::INFINITY) }

  scope :all_by_category, ->(category_name) {
    joins(:category).where('categories.title = ?', category_name).order(title: :DESC)
  }

  def self.titles_of_category(category_name)
    all_by_category(category_name).pluck(:title)
  end
end
