class UsersController < ApplicationController
before_action :find_user, only: [:show, :edit, :update, :destroy]

    def index
        @users =  User.all
        render json: @users
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            render json: {token: create_token(@user.id)}, status: :created
        else
            render json: {error: @user.errors.full_messages}, status: :not_acceptable
        end
    end

    def show
        render json: @user
    end

    private

    def user_params
        params.permit(:username, :email, :password)
    end

    def find_user
        @user = User.find(params[:id])
    end

end
