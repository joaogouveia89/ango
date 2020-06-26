class LoanPaymentsController < ApplicationController
	before_action :set_loan_payments, only: [:create]
	
	def new
		@loanPayment = LoanPayment.new
		@loan = Loan.find(params[:loan_id])
	end

	def create
		get_debts @loanPayment.loan_id
		if @loanPayment.payed_value <= @debts and @loanPayment.save
			flash[:notice] = "Pagamento registrado com sucesso!"
			redirect_to loan_path(Loan.find(@loanPayment.loan_id))
		else
			if @loanPayment.payed_value > @debts
				flash[:notice] = "Voce está tentando pagar mais do que deve, seu debito é de somente € " + @debts.to_s
			end
			render 'new'
		end
	end

	private

	def get_debts loan_id
		@loan = Loan.find(loan_id)
		@allLoanPayments = LoanPayment.where(loan_id: loan_id)
		@debts = @debt = @loan.loaned_amount - @allLoanPayments.sum(:payed_value)
	end

	def set_loan_payments
		@loanPayment = LoanPayment.new(loan_payments_params)
	end

	def loan_payments_params
		params.require(:loan_payment).permit(:loan_id, :payed_value)
	end
end