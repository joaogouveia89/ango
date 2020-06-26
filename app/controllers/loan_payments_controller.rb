class LoanPaymentsController < ApplicationController
	def new
		@loan_id = params[:loan_id]
		@loan_description = Loan.find(@loan_id).description
	end
end