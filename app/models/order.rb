class Order < ApplicationRecord
	belongs_to :user
	belongs_to :food

	enum payment: [ false, true ]

	def pay
	 	self.update(payment: 1)
	end

end
