class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user,              null: false, foreign_key: true
      t.string     :name,              null: false
      t.text       :rebyu,             null: false
      t.integer    :category_id,       null: false
      t.timestamps
    end
  end
end
