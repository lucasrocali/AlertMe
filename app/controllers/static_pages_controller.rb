class StaticPagesController < ApplicationController
  def home
  end

  def map
  # 	@events = Event.all
		# @hash = Gmaps4rails.build_markers(@locations) do |event, marker|
		#   marker.lat event.location.lat
		#   marker.lng event.location.lon
		# end
		@locations = Location.all
		@hash = Gmaps4rails.build_markers(@locations) do |loc, marker|
		  marker.lat loc.lat
		  marker.lng loc.lon
		end
  end
end
