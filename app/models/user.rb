class User < ApplicationRecord
  has_secure_password

  validates :phone, presence: true, uniqueness: { case_sensitive: true }
  validates :name, presence: true
end
