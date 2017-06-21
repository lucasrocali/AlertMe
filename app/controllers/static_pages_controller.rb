class StaticPagesController < ApplicationController
  def home
  	#distance_sql = Graticule::Distance::Spherical.to_sql(:latitude => latitude, :longitude => longitude, :units => :kilometers)
  	@locations = ActiveRecord::Base.connection.execute("Select id,user_id,lat,lon FROM Locations WHERE lat < 0")
  	#@locations = Location.near([-22.70,-43.50], 20)
  	#Store.find(:all, :origin =>[37.792,-122.393], :within=>10)
  	render json: @locations
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

