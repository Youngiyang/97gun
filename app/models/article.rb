class Article < ActiveRecord::Base
  belongs_to :categroy
  belongs_to :user
  mount_uploader :img, AvatarUploader
  validates :title, presence: true
  validates :content, presence: true
  validates :img, presence: true
  validates :categroy_id, presence: true
end
