class Group < ActiveRecord::Base
  attr_accessible :description, :image

	validates :description, presence: true
  has_attached_file :image, styles: { medium: "320x240>"}
  
  validates_attachment :image,
                            content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                            size: { less_than: 5.megabytes }

  has_many :stores

end
