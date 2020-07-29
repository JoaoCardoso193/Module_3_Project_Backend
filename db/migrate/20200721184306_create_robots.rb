class CreateRobots < ActiveRecord::Migration[6.0]
  def change
    create_table :robots do |t|
      t.string :name
      t.integer :user_id
      t.float :health
      t.float :speed
      t.float :attack
      t.float :defense
      t.float :battery_life

      # t.timestamps
    end
  end
end
