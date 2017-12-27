class Food < ApplicationRecord
	belongs_to :user
	has_many :orders, dependent: :destroy

	# scope :search, -> (name) { where("name ILIKE ?", "#{name}%")}
	scope :search, -> (name) { where name: name}
end
