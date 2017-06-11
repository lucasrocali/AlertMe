class AlertTagsController < ApplicationController

	# GET /alerttags
  def index
  	if current_user 
	    @alerttags = AlertTag.where(parent_id: nil)

	    json_response(@alerttags)
	  else
	  	render json: { errors: "Not signed in" }, status: 422
	  end
  end
end
