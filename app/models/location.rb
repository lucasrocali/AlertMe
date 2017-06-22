class Location < ApplicationRecord
  belongs_to :user
  has_many :notifications, dependent: :destroy

 	acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :lat,
                   :lng_column_name => :lon

  validates_presence_of :user_id,:lat, :lon

  def as_json(options = { })
  	super((options || { }).merge({
        :methods => [:user]
    }))
	end
end
