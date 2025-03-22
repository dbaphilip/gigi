class Product < ApplicationRecord
  before_save :set_slug

  belongs_to :user

  has_one_attached :image

  validates :title, length: { minimum: 5 }
  validates :price, numericality: { greater_than: 100 }
  validates :description, length: { minimum: 15 }
  validates :location, presence: true
  # validates :image, presence: true

  validate :acceptable_image

  def to_param
    slug
  end

  private

    def set_slug
      self.slug = "#{title.parameterize}-#{Time.now.getutc.to_s.parameterize}-#{user.id}"
    end

    def acceptable_image
      return unless image.attached?

      unless image.blob.byte_size <= 5.megabyte
        errors.add(:image, "size must be less than 5mb")
      end

      acceptable_types = ["image/jpeg", "image/jpg", "image/png", "image/webp", "image/svg"]
      unless acceptable_types.include?(image.content_type)
        errors.add(:image, "must JPEG, PNG, SVG or WEBP")
      end
    end
    
end
