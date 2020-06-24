class Loan < ActiveRecord::Base
	validates :description, presence: true , length: { minimum: 8, maximum: 50 }
	validates :loaned_amount, presence: true
	validates :default_installment, presence: true
end