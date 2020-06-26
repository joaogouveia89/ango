class BillHistoriesController < ApplicationController
	before_action :set_bill_history, only: [:edit, :update, :show, :destroy]

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
 			flash[:notice] = "Article was successfully created"
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
		@grid_size = calculate_grid_size @averages.count
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
		@grid_size = calculate_grid_size @bills.count
		@sum = @bills.sum(:value)
		render 'bill_history'
	end

 	private

 	def set_bill_history
 		@bill_history = BillHistory.find(params[:id])
 	end

 	def bill_history_params
 		params.require(:bill_history).permit(:bill_id, :month, :year, :value)
 	end

 	def calculate_grid_size items_count
 		@grid_size = items_count / 2
		if @grid_size % 2 != 0
			@grid_size = @grid_size + 1
		end
		@grid_size
 	end
end