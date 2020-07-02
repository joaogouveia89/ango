module API
	module V1
		class MarketProducts < Grape::API
			include API::V1::Defaults
			resource :market_products do
				desc "Return the current market list"
				get "" do
					MarketProduct.where(is_in_current_list: true)
				end
			end
		end
	end
end