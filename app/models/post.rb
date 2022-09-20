class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :comments

  belongs_to :category

  has_one_attached :image

  has_many :favorites, dependent: :destroy

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
 end

  with_options presence: true do
    validates :image
    validates :name
    validates :rebyu
    validates :category_id
  end
  with_options numericality: { other_than: 0 } do
    validates :category_id
    
  end
end
