class CreateUserRobots < ActiveRecord::Migration[6.0]
  def change
    create_table :user_robots do |t|
      t.integer :user_id
      t.integer :robot_id

      t.timestamps
    end
  end
end
