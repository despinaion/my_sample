require 'rails_helper'

describe Product do
	context 'when the product has comments' do
		before do
			@product=Product.create!(name:"race bike")
			@user=FactoryGirl.create(:user)
			@product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
			@product.comments.create!(rating: 3, user: @user, body: "Not so good bike!")
			@product.comments.create!(rating: 5, user: @user, body: "Perfect bike!")
		end

		# Check if we get the actual average rating
		it "returns the average rating of all comments" do
			expect(@product.average_rating).to eq (3)
		end

		# Check if a product with no name but with description passes the test
		it 'is not valid' do
      expect(Product.new(description: "Nice bike")).not_to be_valid
		end
	end
end 
