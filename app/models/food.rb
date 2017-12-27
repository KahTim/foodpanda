class Food < ApplicationRecord
	has_many :orders, dependent: :destroy
end
