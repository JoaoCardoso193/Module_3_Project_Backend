class RobotsController < ApplicationController

    def index
    robots = Robot.all
    render json: robots.to_json(:except => [:created_at, :updated_at], :include => [{:user => {:only => [:id, :user_name]}}, {:parts => {:only => [:id, :name, :image_url, :description, :category, :image_url]}}, {:moves => {:only => [:id, :name, :summary, :description, :category, :target, :stat, :value, :cost]}}])
    # render json: robots.to_json(:except => [:created_at, :updated_at], :include => [{:parts => {:only => [:id, :name, :image_url, :description, :category, :image_url]}}, {:moves => {:only => [:id, :name, :description, :category, :target, :stat, :value, :cost]}}])
    end

    def show
        robot = Robot.find(params[:id])
        render json: robot.to_json(:except => [:created_at, :updated_at], :include => [{:user => {:only => [:id, :user_name]}}, {:parts => {:only => [:id, :name, :image_url, :description, :category, :image_url]}}, {:moves => {:only => [:id, :name, :summary, :description, :category, :target, :stat, :value, :cost]}}])
    end

    def create
        user = User.find_or_create_by(user_name: params[:author])
        robot = Robot.new(robot_params)
        robot.user = user   
        # byebug     
        if robot.valid?
            robot.save

            # creating associations for robot parts
            parts_params.each do |part_id|
                RobotPart.create(robot_id: robot.id, part_id: part_id)
            end

            robot.get_stats

            #creating associations for robot moves
            moves_params.each do |move_id|
                RobotMove.create(robot_id: robot.id, move_id: move_id)
            end

            #saving and rendering final robot JSON
            robot.save
            render json: robot          
        end
    end

    def update
        robot = Robot.find(params[:id])

        robot.name = robot_params[:name]

        if robot.valid?

            #deleting old robot part associations
            old_robot_parts = RobotPart.all.select{|robot_part| robot_part.robot_id == robot.id}
            old_robot_parts.each do |robot_part|
                robot_part.destroy
            end

            #making new robot part associations
            parts_params.each do |part_id|
                RobotPart.create(robot_id: robot.id, part_id: part_id)
            end
        
            #deleting old robot move associations
            old_robot_moves = RobotMove.all.select{|robot_move| robot_move.robot_id == robot.id}
            old_robot_moves.each do |robot_move|
                robot_move.destroy
            end

        #making new robot move associations
            moves_params.each do |move_id|
                RobotMove.create(robot_id: robot.id, move_id: move_id)
            end

            # saving and rendering new robot json
            robot.save
            render json: robot
        end
    end

    def destroy
        robot = Robot.find(params[:robot_id])
        robot.destroy
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

    # def user_params
    #     params.require(:user)
    # end
end