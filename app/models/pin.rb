class Pin < ActiveRecord::Base
  attr_accessible :description, :image, :image_remote_url, :cost, :hours, :pin_heading
  has_many :steps, :dependent => :destroy
  # This line won't work in Rails 4, instead, you'll have to do what I show below

  validates :description, presence: true
  validates :user_id, presence: true
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100"}
  
  validates_attachment :image,
                            content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                            size: { less_than: 5.megabytes }
                          

  belongs_to :user
  has_many :steps, :dependent => :destroy
  has_many :pin_images, :dependent => :destroy

  def image_remote_url=(url_value)
    self.image = URI.parse(url_value) unless url_value.blank?
    super
  end
  
end