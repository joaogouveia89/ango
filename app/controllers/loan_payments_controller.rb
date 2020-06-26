class LoanPaymentsController < ApplicationController
	before_action :get_loan, only: [:new]
	before_action :get_loan_payments, only: [:new]
	def new
		@loanPayment = LoanPayment.new
		@debt = @loan.loaned_amount - @payments.sum(:payed_value)
	end

	def create
		@loanPayment = LoanPayment.new(loan_payments_params)
		if @loanPayment.save
			flash[:notice] = "Pagamento registrado com sucesso!"
			redirect_to loan_path(Loan.find(@loanPayment.loan_id))
		else
			render 'new'
		end
	end

	private
	def get_loan
		@loan = Loan.find(params[:loan_id])
	end

	def get_loan_payments
		@payments = LoanPayment.where(loan_id: @loan.id)
	end

	def loan_payments_params
		params.require(:loan_payment).permit(:loan_id, :payed_value)
	end
end