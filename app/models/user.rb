class User < ApplicationRecord
    has_many :user_robots
    has_many :robots, through: :user_robots

    validates :user_name, presence: true
    validates :user_name, uniqueness: true

    def create_robot(name)
        robot = Robot.create(name: name)
        robot.author = self.user_name
        robot.save
        robot
    end
end
