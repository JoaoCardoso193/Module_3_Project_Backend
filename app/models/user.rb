class User < ApplicationRecord
    has_many :robots

    validates :user_name, presence: true
    validates :user_name, uniqueness: true

    before_destroy :destroy_robots #destroy associated robots upon user deletion

    def create_robot(name)
        robot = Robot.create(name: name)
        robot.user = self
        robot.save
        robot
    end

    def destroy_robots
        self.robots.destroy_all
    end
end
