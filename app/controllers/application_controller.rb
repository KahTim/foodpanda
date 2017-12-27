class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?, :vendor_food, :customer_order
  private
  
  def current_user
    @current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def vendor_food
  	Food.where(user_id: current_user.id)
  end

  def customer_order
    x = []
    @order = Order.where(user_id: current_user.id)

  	@order.each do |o|
      x << Food.find(o.food_id)
    end

    x
  end

end
