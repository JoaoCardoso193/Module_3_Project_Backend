class CreateRobotParts < ActiveRecord::Migration[6.0]
  def change
    create_table :robot_parts do |t|
      t.integer :robot_id
      t.integer :part_id

      # t.timestamps
    end
  end
end
