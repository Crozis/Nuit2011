class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.float :price
      t.string :image_url_big
      t.string :image_url_small
      t.string :deeplink

      t.timestamps
    end
  end
end
