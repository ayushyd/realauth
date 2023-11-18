class ApplicationController < ActionController::Base

	 skip_before_action :verify_authenticity_token


	 private

    def generate_token
		SecureRandom.hex(16)
	end
	 	
	
end
