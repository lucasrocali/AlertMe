class Location < ApplicationRecord
  belongs_to :user

  validates_presence_of :lat, :lon
end
