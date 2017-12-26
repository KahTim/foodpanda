class User < ApplicationRecord
	has_secure_password

	validates :email, presence: true
	validates :email, uniqueness: true
	
	enum role: [ :admin, :customer ] 
end
