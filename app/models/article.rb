class Article < ApplicationRecord

  has_one_attached :image

  attr_accessor :remove_image

  validate :validate_image_extension

  scope :published, ->(order = :desc) { where(published: true).order(created_at: order) }
  scope :hidden, -> { where(published: false) }

  def thumbnail
    image.variant(resize_to_limit: [100, 100], format: 'jpg').processed
  end

  def has_attachment?
    return false if image_attachment.nil?
    true
  end

  private

  def validate_image_extension
    if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
      errors.add(:image, 'You can upload only JPEG or PNG formats')
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "header", "id", "id_value", "published", "updated_at", "image"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob"]
  end

end
