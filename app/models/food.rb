class Food < ApplicationRecord
	belongs_to :user
	has_many :orders, dependent: :destroy

	scope :search_bar, -> (search_bar) { where("name ILIKE ?", "%#{search_bar}%")}
	scope :search, -> (name) { where name: name}
end
