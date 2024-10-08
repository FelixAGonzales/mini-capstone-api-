class Product < ApplicationRecord
  has_many :category_products
  has_many :categories, through: :category_products

  has_many :carted_products
  has_many :users, through: :carted_products
  has_many :orders, through: :carted_products

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  # validates :price, numericality: {greater_than: 0}
  # validates :description , presence: true
  # validates :description , length: { in: 10..500 }
  # belongs_to :supplier

  def is_discounted?
    if price == nil
      price = 0
    end
    if price.to_i <= 11
      return true
    else
      return false
    end
  end

  def tax
    tax = price * 0.09
    # p "The Tax is: $#{tax}"
  end

  def total
    tax = price.to_i * 0.09
    total = tax + price
    # p "The total (including tax) is: $#{total}"
  end

end
