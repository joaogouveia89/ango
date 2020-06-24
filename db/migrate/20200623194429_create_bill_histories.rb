class CreateBillHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :bill_histories do |t|
    	t.references :bill, index: true, foreign_key: true
    	t.integer :month
    	t.integer :year
    	t.decimal :value

    	t.timestamps
    end
  end
end
