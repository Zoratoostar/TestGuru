class Test < ApplicationRecord
  def self.titles_of(category_name)
    category = Category.where(title: category_name).first
    return [] unless category
    self.where(category_id: category.id).pluck(:title).sort { |x, y| y <=> x }
  end
end
