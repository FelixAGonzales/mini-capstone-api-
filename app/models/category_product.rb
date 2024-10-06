class CategoryProduct < ApplicationRecord
  belongs_to :category_id
  belongs_to :product
end
