class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_many :todos
  has_many :steps
  has_many :comments
  
  mount_uploader :avatar, AvatarUploader
end
