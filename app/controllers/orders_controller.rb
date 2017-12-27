class OrdersController < ApplicationController

  def new
  end

  def create
    # @food = Food.find(params[:food_id])
    @order = current_user.orders.new(order_params)
    @order.food_id = params[:food_id]
    # byebug
    if @order.save
      redirect_to users_path, :notice => "Order success"
    else
      redirect_to users_path, :notice => "Failed"
    end

  end

  def edit
  end

  def update
  end

  def destroy
    
    @order = Order.find(params[:id])
    @order.delete
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(:delivery_time)
  end

end
