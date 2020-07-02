class MarketProductsController < ApplicationController
	before_action :set_market_product, only: [:show, :edit, :update, :destroy, :add_remove_from_list, :change_is_default_on_list]
	helper_method :has_items_in_list

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
		@marketProduct.name.capitalize!
		if !MarketProduct.where(name: @marketProduct.name).empty?
			flash[:notice] = "Produto ja existe"
		   redirect_to market_products_path
		elsif @marketProduct.save
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
   			redirect_to market_product_path(@article)
   		else
			flash[:notice] = "Produto não atualizado"
			render 'index'
   		end
	end

	def destroy
		@market_product.destroy
		flash[:notice] = "Produto excluído com sucesso"
  		redirect_to market_products_path
	end

	def add_remove_from_list
		@market_product.is_in_current_list ^= true
		if @market_product.save
   			redirect_to market_products_path
   		else
			flash[:notice] = "Problema ao atualizar o produto"
			render 'index'
		end
	end

	def change_is_default_on_list
		@market_product.is_default_in_list ^= true
		if @market_product.save
   			redirect_to market_products_path
   		else
			flash[:notice] = "Problema ao atualizar o produto"
			render 'index'
		end
	end

	def load_default_list
		@keepItemsSelectedList = ActiveModel::Type::Boolean.new.cast(params[:keep_selected])
		
		MarketProduct.all.each do |product|
			if @keepItemsSelectedList
				if product.is_default_in_list and !product.is_in_current_list
					product.is_in_current_list = true
					product.save
				end
			else
				if product.is_in_current_list and !product.is_default_in_list
					product.is_in_current_list = false
					product.save
				elsif product.is_default_in_list and !product.is_in_current_list
					product.is_in_current_list = true
					product.save
				end
			end
		end
	end

	def has_items_in_list
		!MarketProduct.where(:is_in_current_list => true, :is_default_in_list => false).empty?
	end

	private

	def set_market_product
		@market_product = MarketProduct.find(params[:id])
	end

	def market_product_params
		params.require(:market_product).permit(:name, :department_id, :price, :is_in_current_list, :is_default_in_list)
	end
end