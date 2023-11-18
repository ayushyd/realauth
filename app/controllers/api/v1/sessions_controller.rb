class Api::V1::SessionsController < ApplicationController


	def login
		user = User.find_by(email: params[:email])

		if user&.valid_password?(params[:password])
			sign_in user, store: false
			render json: {message: "user login successfully", user: user.token,code: 200}
	    else
	    
	       render json: {message: user.errors.full_messages, code: 401}
	    end		
	end
end
