class CreateMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :moves do |t|
      t.string :name
      t.string :summary
      t.text :description
      t.string :category
      t.string :target
      t.string :stat
      t.float :value
      t.float :cost

      # t.timestamps
    end
  end
end
