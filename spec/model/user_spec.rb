require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "email_validation" do
    context "when new User object is created" do
      it "should have a unique email" do
        x = User.create(name: "test", email: "1@gmail.com", password: "test")
        y = User.new(name: "test", email: "1@gmail.com", password: "test")
        expect(y.save).to eq false
        # expect {y.save}.to eq false
      end
    end
  end

  describe "email_validation" do
    context "when new User object is created" do
      it "should have a unique email" do
        x = User.create(name: "test", email: "1@gmail.com", password: "test")
        y = User.create(name: "test", email: "1@gmail.com", password: "test")
        expect(x.id && y.id.nil?).to eq true
      end
    end
  end

  describe "orders_association" do
    context "when new User object is created" do
      it "should have many associations with Order model" do
        x = User.create(name: "test", email: "1@gmail.com", password: "test")
        z = Food.create(user_id: x.id)
        y = x.orders.new(delivery_time: "2017-12-29 21:00:00", food_id: z.id)
        y.save
        # puts y.errors.full_messages
        # p z
        # p y
        # expect(y.user_id == x.id).to eq true
        expect(y.id.present?).to eq true
      end
    end
  end

  describe "orders_association" do
    context "when new User object is created" do
      it "should have many associations with Order model" do
        x = User.create(name: "test", email: "1@gmail.com", password: "test")
        z = Food.create(user_id: x.id)
        y = x.orders.new(delivery_time: "2017-12-29 21:00:00", food_id: z.id)
        y.save
        # puts y.errors.full_messages
        # p z
        # p y
        # expect(y.user_id == x.id).to eq true
        expect(y.id.nil?).to eq false
      end
    end
  end


  # describe "#customer?" do
  #   context "when new User object is created" do
  #     it "should be customer by default" do
  #       x = User.new
  #       expect(x.customer?).to eq true
  #     end
  #   end
  # end

  # describe "#title_presence" do
  # 	context "when new ToDo object is created" do
  # 		it "should have a title present" do
  # 			x = Todo.new(title: "Test", complete: false)
  # 			expect(x.title.nil?).to eq false
  # 		end
  # 	end
  # end

  # describe "#completed?" do
  # 	context "when new Todo object is created" do
  # 		it "should be incomplete by default" do
  # 			x = Todo.new
  # 			expect(x.completed?).to eq false
  # 		end
  # 	end
  # end

  # describe "#completed!" do
  # 	context "when .completed! method is used on Todo object" do
  # 		it "complete status should change from false to true" do
  # 			x = Todo.new
  # 			x.complete!
  # 			expect(x.complete).to eq true
  # 		end
  # 	end
  # end

end
