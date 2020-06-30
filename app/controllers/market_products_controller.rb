class MarketProductsController < ApplicationController
	before_action :set_market_product, only: [:show, :edit, :update, :destroy]

	def index
		# I prefer make one loop to feed these two lists, insted of doing two active records search
		@products_in_current_list = []
		@products = []
		MarketProduct.all.order(:name).each do | product |
			if product.is_in_current_list
				@products_in_current_list << product
			end
			@products << product
		end
	end

	def new
		@market_product = MarketProduct.new
	end

	def create
		@marketProduct = MarketProduct.new(market_product_params)
		if @marketProduct.save
		   flash[:notice] = "Produto criado com sucesso"
		   redirect_to market_product_path(@marketProduct)
		  else
		   render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @market_product.update(market_product_params)
			flash[:notice] = "Produto atualizado"
   			redirect_to article_path(@article)
   		else
			flash[:notice] = "Produto não atualizado"
			render 'edit'
   		end
	end

	private

	def set_market_product
		@market_product = MarketProduct.find(params[:id])
	end

	def market_product_params
		params.require(:market_product).permit(:name, :department_id, :price, :is_in_current_list)
	end
end