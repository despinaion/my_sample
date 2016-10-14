class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  scope :rating_desc, -> { order(rating: :desc) }


  scope :rating_asc,  -> { order(rating: :asc) }

  validates :body, presence: true #validation for comment of having text
  validates :user, presence: true #validation for comment of having user_id
  validates :product, presence: true #validation for comment of having product_id
  validates :rating, numericality: { only_integer: true } #validation for comment of having integer rating

  after_create_commit { CommentUpdateJob.perform_later(self, @user) }
end
