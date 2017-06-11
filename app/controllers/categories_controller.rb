class CategoriesController < ApplicationController

	# GET /users
  def index
  	if current_user 
	    @categories = Category.all
	    json_response(@categories)
	  else
	  	render json: { errors: "Not signed in" }, status: 422
	  end
  end
end
