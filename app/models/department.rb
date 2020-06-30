class Department < ActiveRecord::Base
	 has_many :market_products
	 validates :name, presence: true
	 validates :icon_id, presence: true
end