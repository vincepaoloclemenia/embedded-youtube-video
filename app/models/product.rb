class Product < ApplicationRecord
  has_one :product_control, dependent: :destroy
  accepts_nested_attributes_for :product_control
end