module API
  module V1
    class Base < Grape::API
    	prefix    'api'
	    format    :json

	    rescue_from :all, :backtrace => true
	    error_formatter :json, API::V1::ErrorFormatter

	    before do
	      error!("401 Unauthorized", 401) unless authenticated
	    end

	    helpers do
	      def warden
	        env['warden']
	      end

	      def authenticated
	        return true if warden.authenticated?
	        header = headers["Auth-Token"]
	        header && @user = User.find_by_authentication_token(header)
	      end

	      def current_user
	        warden.user || @user
	      end
	    end
      	mount API::V1::MarketProducts
    end
  end
end