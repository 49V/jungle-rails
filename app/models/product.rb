class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  has_many :reviews
  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def sold_out? 
    quantity == 0
  end

  def get_average_rating
    # Rounds the average to the nearest whole number, i.e. (4.3).round = 4, (4.6).round = 5
    average = self.reviews.average(:rating).to_f.round()
  end

  def reviews_exist?
    self.reviews.length > 0
  end

end
