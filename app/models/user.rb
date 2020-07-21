class User < ApplicationRecord
    has_many :user_robots
    has_many :robots, through: :user_robots
end
