class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
    	t.string :name
    	t.string :type
    	t.string :price
    	t.string :location

      t.timestamps
    end
  end
end
