class CreateMarketProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :market_products do |t|
    	t.string :name
    	t.references :department, index: true, foreign_key: {on_delete: :cascade}
    	t.decimal :price
    	t.boolean :is_in_current_list

    	t.timestamps
    end
  end
end
