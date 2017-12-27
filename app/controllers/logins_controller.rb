class LoginsController < ApplicationController

	def create
		@user = User.find_by(email:params[:logins][:email])
	  if @user.authenticate(params[:logins][:password])
	    session[:current_user_id] = @user.id
	    redirect_to users_path, :notice => "Logged in!"
	   else
	   	flash.now.alert = "Invalid email or password" 
	   	redirect_to root_path
	  end
	end

	def destroy
	  # Remove the user id from the session
	  @_current_user = session[:current_user_id] = nil
	  redirect_to root_path, :notice => "Logged out!"
	  reset_session
	end

end
