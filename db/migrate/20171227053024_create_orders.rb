class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
    	t.datetime :delivery_time
    	t.references :user, foreign_key: true
    	t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
