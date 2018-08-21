class Tweet < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :content, presence: true,length: {maximum:140}
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
