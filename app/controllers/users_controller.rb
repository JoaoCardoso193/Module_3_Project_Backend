class UsersController < ApplicationController

    def index
    users = User.all
    render json: users.to_json(:include => {
        :robots => {:include => [:parts, :moves]}
        })
    end

    def show
        user = User.find(params[:id])
        render json: user
    end
end