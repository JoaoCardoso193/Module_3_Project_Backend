class RobotsController < ApplicationController

    def index
    robots = Robot.all
    render json: robots.to_json(:except => [:created_at, :updated_at], :include => [{:parts => {:only => [:id, :name, :description, :category, :image_url]}}, {:moves => {:only => [:id, :name, :description, :category, :target, :stat, :value, :cost]}}])
    end

    def show
        robot = Robot.find(params[:id])
        render json: robot.to_json(:except => [:created_at, :updated_at], :include => [{:parts => {:only => [:id, :name, :description, :category, :image_url]}}, {:moves => {:only => [:id, :name, :description, :category, :target, :stat, :value, :cost]}}])
    end
end