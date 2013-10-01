class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  attr_accessible :name, :email, :password, :password_confirmation, 
  								:remember_me, :provider, :uid, 
  								:as => [:default, :admin]
  
  has_many :pins, :dependent => :destroy

end
