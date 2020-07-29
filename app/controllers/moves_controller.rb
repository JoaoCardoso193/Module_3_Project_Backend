class MovesController < ApplicationController

    def index
    moves = Move.all
    render json: moves.to_json(:except => [:created_at, :updated_at])
    end

    def show
        move = Move.find(params[:id])
        render json: move.to_json(:except => [:created_at, :updated_at])
    end
end