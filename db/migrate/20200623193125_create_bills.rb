class CreateBills < ActiveRecord::Migration[6.0]
  def change
    create_table :bills do |t|
    	t.string :name
    	t.string :image_icon

    	t.timestamps
    end
  end
end
