require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"


  describe "#pay" do
  	context "when pay method is used on Order object" do
  		it "payment status should change from false to true" do
        x = User.create(name: "test", email: "1@gmail.com", password: "test")
        z = Food.create(user_id: x.id)
  			y = Order.create(user_id: x.id, food_id: z.id)
        p y
        p x
  			y.pay
  			expect(y.payment).to eq true
  		end
  	end
  end

  describe "#pay" do
    context "when pay method is not used on Order object" do
      it "payment status should be false by default " do
        x = User.create(name: "test", email: "1@gmail.com", password: "test")
        z = Food.create(user_id: x.id)
        y = Order.create(user_id: x.id, food_id: z.id)
        # y.pay
        expect(y.payment).to eq false
      end
    end
  end

end
