class AddStarToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :star, :string
  end
end
