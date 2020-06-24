class Bill < ActiveRecord::Base
	validates :name, presence: true
	validates :image_icon, presence: true
end