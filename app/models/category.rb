class Category < ApplicationRecord
	has_many :subcategories, class_name: "Category",
                          foreign_key: "parent_id"

  belongs_to :parent, class_name: "Category", optional: true

  after_initialize :get_subcategories

  def get_subcategories
  	subcategories = Category.where(id: parent_id)
  end
end
