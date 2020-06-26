class CreateLoanPayments < ActiveRecord::Migration[6.0]
  def change
    create_table :loan_payments do |t|
    	t.references :loan, index: true, foreign_key: true
    	t.decimal :payed_value

    	t.timestamps
    end
  end
end
