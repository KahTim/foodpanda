class Order < ApplicationRecord
	belongs_to :user
	belongs_to :food

<<<<<<< HEAD
=======
	enum payment: [ false, true ]

	def pay
	 	self.update(payment: 1)
	end

>>>>>>> 57f5db204f2423792e1ae0d224bbb32849398653
end
