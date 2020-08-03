class BillHistoriesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_bill_history, only: [:edit, :update, :show, :destroy]

	helper_method :get_column_size, :get_month_verbose

	$monthsVerbose = {
		1 => "Janeiro",
		2 => "Fevereiro",
		3 => "Março",
		4 => "Abril",
		5 => "Maio",
		6 => "Junho",
		7 => "Julho",
		8 => "Agosto",
		9 => "Setembro",
		10 => "Outubro",
		11 => "Novembro",
		12 => "Dezembro"
	}

	def index
		@bill_histories = BillHistory.order(year: :desc, month: :desc)
	end

	def new
		@bill_history = BillHistory.new
 	end

 	def create
 		@bill_history = BillHistory.new(bill_history_params)
 		if @bill_history.save
 			flash[:notice] = "Conta cadastrada com sucesso"
 			redirect_to bill_history_path(@bill_history)
 		else
 			render 'new'

 			#https://stackoverflow.com/questions/35899433/how-to-render-partial-on-the-same-page-after-clicking-on-link-to-with-ajax
 			#read this
 		end
 	end

 	def show
 	end

 	def edit
	end

	def get_month_verbose month_number
		$monthsVerbose[month_number]
	end

	def update
		if @bill_history.update(bill_history_params)
			flash[:notice] = "Conta atualizada com sucesso"
   			redirect_to bill_history_path(@bill_history)
   		else
   			flash[:notice] = "Falha ao atualizar conta"
   			render 'edit'
   		end
	end

	def destroy
		@bill_history.destroy
		flash[:notice] = "Registro de conta excluído"
		redirect_to bill_histories_path
	end

	def year_average
		@year = params[:year]
		@averages = BillHistory.where(:year=> @year).group(:bill_id).average(:value)
		@bills_per_row = 2
		@averages_chart_data = {}
		@averages.each do |bill, average|
			bill_name = Bill.find(bill).name
			@averages_chart_data[bill_name] = average
		end
		@sum = @averages.map { |key, value| value }.sum
		render 'year_average'
	end

	def get_bill_history
		@year = params[:year]
		@month = params[:month]
		@bills = BillHistory.where(:year=> @year, :month=> @month)
		@sum = @bills.sum(:value)
		@bills_per_row = 2
		render 'bill_history'
	end

	def get_column_size(index, list)
		list_size = list.count
		if ((index + 1) == list_size) and list.count % 2 != 0
			12
		else
			6
		end
	end

 	private


 	def set_bill_history
 		@bill_history = BillHistory.find(params[:id])
 	end

 	def bill_history_params
 		params.require(:bill_history)[:value].sub! ",", ""
 		params.require(:bill_history).permit(:bill_id, :month, :year, :value)
 	end
end