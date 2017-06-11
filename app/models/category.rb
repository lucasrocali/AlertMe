class Category < ApplicationRecord
	has_many :subcategories, class_name: "Category",
                          foreign_key: "parent_id"

  belongs_to :parent, class_name: "Category", inverse_of: :subcategories, optional: true

  def as_json(options = { })
  	super((options || { }).merge({
        :methods => [:subcategories]
    }))
	end
end
