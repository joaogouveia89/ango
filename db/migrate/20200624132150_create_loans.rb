class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :loans do |t|
    	t.text :description
    	t.decimal :loaned_amount
    	t.decimal :default_installment

    	t.timestamps
    end
  end
end
