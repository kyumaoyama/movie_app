class Post < ApplicationRecord

  belongs_to :user

  belongs_to :category

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
