class Product < ApplicationRecord

  belongs_to :user

  validates :title, length: { minimum: 5 }
  validates :price, numericality: { greater_than: 100 }
  validates :description, length: { minimum: 30 }

end
