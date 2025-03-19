class User < ApplicationRecord
  before_save :set_slug

  has_secure_password

  has_many :products

  validates :phone,
              length: { minimum: 11, maximum: 11},
              uniqueness: { case_sensitive: true }
  validates :name, presence: true

  def to_param
    slug
  end

  private

    def set_slug
      # self.slug = "#{name.parameterize}-#{Time.now.getutc.to_s.parameterize}"
      self.slug = "#{name.parameterize}-#{phone.parameterize}"
    end

end
