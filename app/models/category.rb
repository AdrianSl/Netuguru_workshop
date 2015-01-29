class Category < ActiveRecord::Base
  has_many :products, dependent: :destroy

  validates :name, uniqueness: { case_sensitive: true }, presence: true
end
