class UsersController < ApplicationController
before_action :find_user, only: [:show, :edit, :update, :destroy]

    def index
        @users =  User.all
        render json: @users
    end

    def create
          @user = User.create(user_params)
        if @user.valid?
            render json: @user, status: :created
        else
            render json: {errors: @user.errors.full_messages}, status: 400
        end
    end

    def show
        render json: @user
    end

    private

    def user_params
        params.permit(:first_name, :last_name, :username, :email, :password)
    end

    def find_user
        @user = User.find(params[:id])
    end

end
