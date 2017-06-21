class EventsController < ApplicationController

	before_action :save_location, only: [:new, :create]

	# GET /events
  def index
  	if current_user 
	    @events = Event.all

	    json_response(@events)
	  else
	  	render json: { errors: "Not signed in" }, status: 200
	  end
  end

   # POST /events
  def create
  	if current_user 
  		
  		#event_params.merge({:location_id => location.id})
	  	#json_response(event_params)

	    @event = Event.create!(event_params)
	    json_response(@event, :created)
  	end
  end

  def save_location
  	puts 'save_location'
  	if current_user 
  		puts '1'
	  	@location = Location.create!(:user_id => current_user.id, :lat => params[:lat], :lon => params[:lon])
	  	puts @location
	  	puts '2'
	  end
	end

  def event_params
    # whitelist params
    puts 'event_params'
    params.permit(:category_id, :importance, :comment).merge(location_id: @location.id)
  end
end
