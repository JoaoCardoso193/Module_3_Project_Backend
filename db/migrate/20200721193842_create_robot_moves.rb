class CreateRobotMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :robot_moves do |t|
      t.integer :robot_id
      t.integer :move_id

      # t.timestamps
    end
  end
end
