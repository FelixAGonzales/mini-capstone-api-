class Product < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :price, numerality: {greater_than: 0}
  validates :description , presence: true
  validates :description , length: { in: 10..500 }

  def is_discounted?
    if price <= 10
      return true
    else
      return false
    end
  end

  def tax
    tax = price * 0.09
    p "The Tax is: $#{tax}"
  end

  def total
    tax = price * 0.09
    total = tax + price
    p "The total (including tax) is: $#{total}"
  end

end
