class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  # price must be a number greater than 0 and is limited to two decimal places
  validates :price, presence: true, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}

  def average_rating
    reviews.map(&:rating).sum.fdiv(reviews.count)
  end

end
