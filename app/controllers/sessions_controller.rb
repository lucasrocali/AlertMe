class SessionsController < ApplicationController
	def new
  end

  def create
    #@users = User.all
    #@user = User.create!(user_params)
    #json_response(@users)
    #
    #json_response(@user, :created)
    # user_password = params[:session][:password]
    # user_email = params[:session][:email]
    # user = user_email.present? && User.find_by(email: user_email)

    
    user_name = params[:user][:name]
    user_email = params[:user][:email]
    user_password = params[:user][:password]

    user = user_email.present? && User.find_by(email: user_email)

    if user.nil?
    	user = User.create({name: user_name,
    								email: user_email,
                    password: user_password,
                    password_confirmation: user_password})
    end

  	if user.valid_password? user_password
      sign_in user, store: false
      user.generate_authentication_token!
      user.save!
      render json: user, status: 200
    else
      render json: { errors: "Invalid email or password" }, status: 422
    end

 
    
    
  end

  def destroy
  	json_response(current_user)
  	# user = current_user

  	# user = User.find_by(auth_token: params[:id])
  	# if user 
	  #   user.generate_authentication_token!
	  #   #user.save!
	  # end
   #  head 204
  end

  def user_params
    # whitelist params
    params.permit(:name, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
