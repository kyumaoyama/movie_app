class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         mount_uploader :avatar, AvatarUploader
         has_many :posts
         has_many :comments 

         validates :nickname, presence: true
         validates :name, presence: true
         validates :avatar, presence: true
end
