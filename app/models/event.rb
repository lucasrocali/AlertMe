class Event < ApplicationRecord
  belongs_to :location
  belongs_to :category

  has_many :notifications, dependent: :destroy


  def as_json(options = { })
  	super((options || { }).merge({
        :methods => [:category,:location]
    }))
	end
end
