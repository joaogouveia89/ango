module API
	class AuthController < ApplicationController
		skip_before_action :verify_authenticity_token
		def auth
			credentials = auth_params
			user = User.find_by_email(credentials["email"])
			unless user.nil? or !user.valid_password?(credentials["password"])
				@response = {
					"response" => {
						"status": 200,
						"auth_token": user.authentication_token
					}
				}
			else
				@response = {
					"response" => {
						"status": 401,
						"auth_token": nil
					}
				}
			end
			render :json => @response
		end

		private

		def auth_params
			necessary_params = {"email" => params[:email], "password" => params[:password]}
			necessary_params
		end
	end
end