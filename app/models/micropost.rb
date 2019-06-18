class Micropost < ApplicationRecord
  belongs_to :user
  default_scope ->{order(created_at: :desc)}
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.micropost_max}
  validate :picture_size

  scope :follow_current_user, (lambda do |follower_ids, user_id|
    where(user_id: follower_ids).or(where(user_id: user_id))
  end)
  private
  def picture_size
    return unless picture.size > Settings.picture_size.megabytes
    errors.add(:picture, t("less_than_5MB"))
  end
end
