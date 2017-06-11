class AlertTag < ApplicationRecord
	has_many :subtags, class_name: "AlertTag",
                          foreign_key: "parent_id"

  belongs_to :parent, class_name: "AlertTag", inverse_of: :subtags, optional: true

  def as_json(options = { })
  	super((options || { }).merge({
        :methods => [:subtags]
    }))
	end
end
