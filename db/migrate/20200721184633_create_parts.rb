class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :image_url
      t.float :health
      t.float :speed
      t.float :attack
      t.float :defense
      t.float :battery_life

      # t.timestamps
    end
  end
end
