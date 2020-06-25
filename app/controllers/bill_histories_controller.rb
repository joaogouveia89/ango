class BillHistoriesController < ApplicationController
	before_action :set_bill_history, only: [:edit, :update, :show, :destroy]

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
		calculate_year_average params[:year]
	end

	def year_average
		@year = params[:year]
		@averages = BillHistory.where(:year=> @year).group(:bill_id).average(:value)
		@grid_size = @averages.count / 2
		if @grid_size % 2 != 0
			@grid_size = @grid_size + 1
		end
		render 'year_average'
	end

 	private

 	def set_bill_history
 		@bill_history = BillHistory.find(params[:id])
 	end

 	def bill_history_params
 		params.require(:bill_history).permit(:bill_id, :month, :year, :value)
 	end
end