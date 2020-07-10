class PagesController < ApplicationController
before_action :authenticate_user!
 def index
 	@bills_message  = get_bills_regarding_message
 	@debs_message = get_debs_regarding_message
 end

 def about
 end

 def usefull_links
 end

 def distribution_calculation
 end

 private

 def get_debs_regarding_message
	@debt_with_house = Loan.all.map{|loan| loan.loaned_amount }.sum - LoanPayment.all.map{|lp| lp.payed_value}.sum
	if @debt_with_house > 0
		debs_message = sprintf("Há débito com as contas da casa no valor de € %.2f", @debt_with_house)
		bootstrap_bg = "warning"
	else
		debs_message = "Não há debitos com as contas da casa"
		bootstrap_bg = "success"
	end
	Services::Message.new(debs_message, bootstrap_bg)
 end

 def get_bills_regarding_message
 	bh = BillHistoriesController.new
 	lbm = last_bill_month
 	if (Time.current.month - 1) > lbm
 		month_verbose = bh.get_month_verbose (lbm)
 		bills_message = "Ainda faltam registrar contas para o mês de " + month_verbose
 		bootstrap_bg = "warning"
 	else
 		bills_message = "Contas Atualizadas"
 		bootstrap_bg = "success"
 	end
 	Services::Message.new(bills_message, bootstrap_bg)
 end

 def last_bill_month
 	@month = BillHistory.last.month
 	@month
 end
end