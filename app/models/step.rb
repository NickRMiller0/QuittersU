class Step < ActiveRecord::Base
  attr_accessible :description, :pin_id, :step_title

  validates :description, presence: true
  validates :pin_id, presence: true
  validates :user_id, presence: true

belongs_to :user
belongs_to :pin
has_many :step_images, :dependent => :destroy
  

end
