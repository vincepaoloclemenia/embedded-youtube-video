class Product < ApplicationRecord
  has_one :product_control, dependent: :destroy
end