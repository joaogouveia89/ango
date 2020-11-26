class Loan < ActiveRecord::Base
	validates :description, presence: true , length: { minimum: 8, maximum: 50 }
	validates :loaned_amount, presence: true
	validates :default_installment, presence: true


	def percentage_paid_off
		return ((amount_paid * 100) / self.loaned_amount).to_i
	end

	def debt
		debt = self.loaned_amount - amount_paid
		debt
	end

	def amount_paid
		return LoanPayment.where(loan_id: self.id).sum(:payed_value)
	end
end