class Product < ApplicationRecord

  belongs_to :user

  has_one_attached :image

  validates :title, length: { minimum: 5 }
  validates :price, numericality: { greater_than: 100 }
  validates :description, length: { minimum: 30 }

  validate :acceptable_image

  private

    def acceptable_image
      return unless image.attached?

      unless image.blob.byte_size <= 5.megabyte
        errors.add(:image, "size must be less than 5mb")
      end

      acceptable_types = ["image/jpeg", "image/jpg", "image/png", "image/webp"]
      unless acceptable_types.include?(image.content_type)
        errors.add(:image, "must JPEG, PNG, or WEBP")
      end
    end
    
end
