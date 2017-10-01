class StaticPagesController < ApplicationController
  def home

    @somewhere = Location.find(100)
    @locations = Location.where.not(:id => @somewhere.id).within(10, :origin => @somewhere).group(:user_id)

    @locations.each do |location|
      #Notification.create!(:location_id => location.id,:event_id => 1)
    end

  	render json: @locations
  end

  def map
  # 	@events = Event.all
		# @hash = Gmaps4rails.build_markers(@locations) do |event, marker|
		#   marker.lat event.location.lat
		#   marker.lng event.location.lon
		# end
		@locations = Location.all

    @events = Event.all

    @notifications = Notification.all
		# @hash = Gmaps4rails.build_markers(@locations) do |loc, marker|
  #     marker.title loc.id
		#   marker.lat loc.lat
		#   marker.lng loc.lon
		# 
    @hashl = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.lat
      marker.lng location.lon
      marker.title "#{location.id}-#{location.user.name}"
      marker.json({
        :name => location.id,
      })

    end

    @circles = []

    @hashe = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event.location.lat
      marker.lng event.location.lon
      marker.title "#{event.id}-#{event.category.name}"

      marker.picture({
         :url => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=A|007FFF|000000",
         :width   => 32,
         :height  => 32
      })

      @circles << {'lat' => event.location.lat, 'lng' => event.location.lon, 'radius' => 10000}
    end

     
  end
end

