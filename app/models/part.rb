class Part < ApplicationRecord
    has_many :robot_parts
    has_many :robots, through: :robot_parts
end
