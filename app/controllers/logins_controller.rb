class LoginsController < ApplicationController

	def create
	  if user = User.authenticate(params[:email], params[:password])
	    session[:current_user_id] = user.id
	    redirect_to root_url
	  end
	end

	def destroy
	  # Remove the user id from the session
	  @_current_user = session[:current_user_id] = nil
	  redirect_to root_url
	end

end
