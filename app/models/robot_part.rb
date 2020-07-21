class RobotPart < ApplicationRecord
    belongs_to :robot
    belongs_to :part
end
