class Department < ActiveRecord::Base
	 validates :name, presence: true
	 validates :icon_id, presence: true
end