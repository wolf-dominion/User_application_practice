class UsersController < ApplicationController
    #before_action

    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find(params[:id])
        render json: @user

    end

    def create
        @user = User.new(user_params)
        if @user.save
            # render json: {message: "User was successfully created", user: @user}
            render json: @user
            # render json: @user
        else
            render json: @user.errors.messages
            # render status: 404
        end

        # @user = User.create(user_params)
        # # redirect_to users_path
        # render json: @user
    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            render json: {message: "User was successfully updated", user: @user}
        else
            render json: @user.errors.messages
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: {message: "#{@user} was destroyed"}
        # redirect_to action: "index"
    end

    private

    def user_params
        params.require(:user).permit([:name, :username, :email, :password])
    end
end
