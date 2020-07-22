class Move < ApplicationRecord
    has_many :robot_moves
    has_many :robots, through: :robot_moves
end
