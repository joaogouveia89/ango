class AddIsDefaultListToMarketProducts < ActiveRecord::Migration[6.0]
  def change
  	add_column :market_products, :is_default_in_list, :boolean, {:after => :is_in_current_list}
  end
end
