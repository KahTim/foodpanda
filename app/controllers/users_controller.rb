class UsersController < ApplicationController

	def index
		if current_user.vendor?
			@food = Food.where(user_id: current_user.id)
		# else
		# 	@food =  
		end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to root_path, :flash => { :success => "Successful!" }
		else
			redirect_to new_user_path
		end

	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

end
