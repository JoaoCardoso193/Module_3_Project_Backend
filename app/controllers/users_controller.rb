class UsersController < ApplicationController

    def index
    users = User.all
    render json: users.to_json(:include => {
        :robots => {:include => [:user, :parts, :moves]}
        })
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def create
        user = User.new(user_name: params[:user_name])
        if user.valid?
            user.save
        end
        render json: user
    end

    def update
        user = User.find_by(user_name: params[:old_user_name])
        user.user_name = params[:new_user_name]
        if user.valid?
            user.save
            render json: user
        end
    end

    def destroy
        user = User.find(params[:user_id])
        user.destroy
    end
end