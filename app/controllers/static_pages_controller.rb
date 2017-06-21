class StaticPagesController < ApplicationController
  def home
  end

  def map
  	@locations = Location.all
		@hash = Gmaps4rails.build_markers(@locations) do |user, marker|
		  marker.lat user.lat
		  marker.lng user.lon
		end
  end
end
