class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |p|
      p.string :title
      p.text :description
      p.integer :price
      p.string :email
      p.string :secret_key
      p.integer :category_id
      p.timestamps
    end
  end
end
