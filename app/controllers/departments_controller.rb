class DepartmentsController < ApplicationController
	def new
		@department = Department.new
	end

	def create
		@department = Department.new(departments_params)
		@department.save
	end

	private

	def departments_params
		params.require(:department).permit(:name, :icon_id)
	end
end