require 'securerandom'

class Api::V1::UsersController < ApplicationController
   
   before_action :authenticate_user_by_token! , only: [:show]
   
	def show

		render json: {user: current_user}, status: :ok
	end
	

	def create
		@user = User.new(user_params)
		    if @user.save
		    	token = generate_token
		    	@user.update(token: token)
		    	render json: {user: @user, code: 200}
		    else
		    
		        render json: {message: @user.errors.full_messages, code: 401}
		    end    	
	end


	private


	def user_params
		params.permit(:email,:password,:password_confirmation, :name, :address)
	end

	def authenticate_user_by_token!
        token = request.headers['Authorization'] 
        user = User.find_by(token: token)

        if user
            sign_in user, store: false 
        else
            render json: { error: 'Invalid token' }, status: :unauthorized
        end
    end	
end
