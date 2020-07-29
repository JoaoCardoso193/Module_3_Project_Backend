class PartsController < ApplicationController

    def index
    parts = Part.all
    render json: parts.to_json(:except => [:created_at, :updated_at])
    end

    def show
        part = Part.find(params[:id])
        render json: part.to_json(:except => [:created_at, :updated_at])
    end
end