class User < ApplicationRecord
  has_secure_password

  validates :phone,
              length: { minimum: 11, maximum: 11},
              uniqueness: { case_sensitive: true }
  validates :name, presence: true
end
