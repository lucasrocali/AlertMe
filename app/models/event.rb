class Event < ApplicationRecord
  belongs_to :location
  belongs_to :category


  def as_json(options = { })
  	super((options || { }).merge({
        :methods => [:category,:location]
    }))
	end
end
