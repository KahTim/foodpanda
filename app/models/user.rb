class User < ApplicationRecord
	has_secure_password

	validates :email, presence: true
	validates :email, uniqueness: true
	
	enum role: [ :customer, :vendor ] 

	has_many :foods, dependent: :destroy
	has_many :orders, dependent: :destroy

end
