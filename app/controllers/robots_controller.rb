class RobotsController < ApplicationController

    def index
    robots = Robot.all
    render json: robots.to_json(:except => [:created_at, :updated_at], :include => [{:parts => {:only => [:id, :name, :image_url, :description, :category, :image_url]}}, {:moves => {:only => [:id, :name, :summary, :description, :category, :target, :stat, :value, :cost]}}])
    # render json: robots.to_json(:except => [:created_at, :updated_at], :include => [{:parts => {:only => [:id, :name, :image_url, :description, :category, :image_url]}}, {:moves => {:only => [:id, :name, :description, :category, :target, :stat, :value, :cost]}}])
    end

    def show
        robot = Robot.find(params[:id])
        render json: robot.to_json(:except => [:created_at, :updated_at], :include => [{:parts => {:only => [:id, :name, :image_url, :description, :category, :image_url]}}, {:moves => {:only => [:id, :name, :summary, :description, :category, :target, :stat, :value, :cost]}}])
    end

    def create
        user = User.find{|user| user.user_name == robot_params[:author]}
        robot = Robot.new(robot_params)
        
        if robot.valid?
            robot.save
            # creatuing associations for robot parts
            parts_params.each do |part_id|
                RobotPart.create(robot_id: robot.id, part_id: part_id)
            end
            robot.get_stats
            #creating associations for robot moves
            moves_params.each do |move_id|
                RobotMove.create(robot_id: robot.id, move_id: move_id)
            end
            #creating user-robot association
            UserRobot.create(user_id: user.id, robot_id: robot.id)

            #saving and rendering final robot JSON
            robot.save
            render json: robot          
        end


    end

    private

    def robot_params
        params.require(:robot).permit(:name, :author)
    end

    def parts_params
        params.require(:parts)
    end

    def moves_params
        params.require(:moves)
    end
end