class PagesController < ApplicationController
before_action :authenticate_user!
 def index
 	@quote  = Quote.find(Quote.pluck(:id).shuffle.first)
 end

 def about
 end

 def usefull_links
 end

 def distribution_calculation
 end

 private
end