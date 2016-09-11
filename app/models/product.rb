class Product < ActiveRecord::Base
	has_many :comments
	has_many :orders

	validates :name, presence: true #validation for new product to have name

	def highest_rating_comment

  		comments.rating_desc.first
	end

	def lowest_rating_comment
		comments.rating_asc.first
	end

	def average_rating
  		comments.average(:rating).to_f
	end

	

end
