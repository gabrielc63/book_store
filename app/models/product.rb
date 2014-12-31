class Product < ActiveRecord::Base
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  # validates :image_url, allow_blank: true
  validates_format_of :image_url, :with => %r{\.(gif|jpg|png)\z}i

  def self.latest
    Product.order(:updated_at).last
  end
end
