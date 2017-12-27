class FoodsController < ApplicationController
	
	def index
		@food = Food.all
	end

  def new
  	@food = Food.new
  end

  def create
  	@food = current_user.build_food(food_params)

  	if @food.save
  		redirect_to foods_path, :flash => { :success => "Successfully created food listing!" }
  	else
  		redirect_to new_food_path, :notice => "Failed to create food listing"
  	end
  end

  def show
  end

  def destroy
  end

  private

  def food_params
  	params.require(:food).permit(:name, :cuisine, :price, :location)
  end

end