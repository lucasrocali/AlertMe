class LocationsController < ApplicationController

	# GET /locations
  def index
  	puts 'PARAMS'
  	puts params
  	if current_user 
  		@notifications = Notification.where(:event_id => params['event_id'])


	    @locations = []
	    @notifications.each do |notific| 
	    	@locations << notific.location
	    end

	    json_response(@locations)
	  else
	  	render json: { errors: "Not signed in" }, status: 200
	  end
  end
end
