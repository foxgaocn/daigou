class Category < ActiveRecord::Base
  has_many :sub_categories, class_name: "Category", foreign_key: "parent_category_id"
  belongs_to :parent_category, class_name: "Category"

  scope :top, -> { where(parent_category: nil).order(:id)}
  
  def self.concrete
    non_concrete_ids = Category.pluck(:parent_category_id).compact.uniq
    Category.where('id not in (?)', non_concrete_ids)
  end

  def has_child?
    !sub_categories.empty?
  end

  def category_class
    sub_categories.empty? ? '' : 'dropdown' 
  end
end
