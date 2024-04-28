class Community < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id

  mount_uploader :icon, ImageUploader

  def random_image
    self.icon
  end
end
