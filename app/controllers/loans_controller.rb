class LoansController < ApplicationController
	before_action :set_loan, only: [:show, :destroy]

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
	end

	def destroy
		@loan.destroy
		flash[:notice] = "Emprestimo excluído com sucesso!"
		redirect_to loans_path
	end

	private

	def set_loan
		@loan = Loan.find(params[:id])
	end

	def loan_params
		params.require(:loan).permit(:description, :loaned_amount, :default_installment)
	end
end