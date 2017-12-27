class BraintreeController < ApplicationController
  def new
	  @order = Order.find(params[:id])
		@client_token = Braintree::ClientToken.generate
  end

  def checkout
    @order = Order.find(params[:id])
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

    result = Braintree::Transaction.sale(
     :amount => Food.find(@order.food_id).price, #this is currently hardcoded
     :payment_method_nonce => nonce_from_the_client,
     :options => {
        :submit_for_settlement => true
      }
     )

    if result.success?
      @order.pay
      redirect_to :root, :flash => { :success => "Transaction successful!" }
    else
      redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
    end
  end

end
