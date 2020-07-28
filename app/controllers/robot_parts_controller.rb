class RobotPartsController < ApplicationController

    def index
    robot_parts = RobotPart.all
    render json: robot_parts.to_json(:except => [:created_at, :updated_at])
    end

    def create
        robot_part = RobotPart.new(robot_parts_params)
        byebug
        if robot_part.valid?
            robot_part.save
            render json: robot_part         
            # create associations for robot_partsparts, robot_partsmoves, and userrobot_partss, then call robot_parts.get_stats
        end


    end

    private

    def robot_parts_params
        params.require(:robot_part).permit(:robot_id, :part_id)
    end

    # def parts_params
    #     params.require(:robot_parts).permit(:parts)
    # end
end