class CategoriesController < ApplicationController

	# GET /categories
  def index
  	if current_user 
	    @categories = Category.where(parent_id: nil)

	    json_response(@categories)
	  else
	  	render json: { errors: "Not signed in" }, status: 422
	  end
  end
end
