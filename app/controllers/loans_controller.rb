class LoansController < ApplicationController
	before_action :set_loan, only: [:show, :destroy]
	helper_method :get_amount_paid

	def index
		@loans = Loan.all	
	end

	def new
		@loan = Loan.new
	end

	def create
		@loan = Loan.new(loan_params)
		@loan.description.capitalize!
		if @loan.save
			flash[:notice] = "Emprestimo registrado com sucesso!"
			redirect_to loan_path(@loan)
		else
			render 'new'
		end
	end

	def show
		@payments = LoanPayment.where(loan_id: @loan.id)
		@debt = @loan.loaned_amount - @payments.sum(:payed_value)
	end

	def destroy
		@loan.destroy
		flash[:notice] = "Emprestimo excluído com sucesso!"
		redirect_to loans_path
	end

	def get_amount_paid loan
		@amount_paid = LoanPayment.where(loan_id: loan.id).sum(:payed_value)
	end

	private

	def set_loan
		@loan = Loan.find(params[:id])
	end

	def loan_params
		params.require(:loan).permit(:description, :loaned_amount, :default_installment)
	end
end