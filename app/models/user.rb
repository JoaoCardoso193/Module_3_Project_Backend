class User < ApplicationRecord
    has_many :user_robots
    has_many :robots, through: :user_robots

    def create_robot(name)
        robot = Robot.create(name: name)
        robot.author = self.user_name
        robot.save
        robot
    end
end
